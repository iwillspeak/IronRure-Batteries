$ErrorActionPreference = "Stop"

$platform="Windows"

# Make sure the source is up to date
&git submodule init
&git submodule update
if ($LASTEXITCODE -ne 0)
{
    Write-Error "Git failed"
    exit -1
}

# Get a version of NuGet
if (!(Test-Path .\nuget.exe))
{
    Invoke-WebRequest "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" -OutFile nuget.exe
}

# Clean up the output directory first
if (Test-Path "contents") {
    Remove-Item -Force -Recurse -ErrorAction Continue contents
}


function BuildForRid([string] $rid, [string] $toolchain, [string] $buildscript)
{
    Write-Host "compiling for $rid using $toolchain"

    &rustup default $toolchain

    &cmd /c $buildscript

    # create a folder for the package to reside in
    &mkdir -p runtimes/$rid/native/
    Copy-Item rure/target/release/rure* runtimes/$rid/native/
}

BuildForRid "win-x86" "stable-i686" "buildi686.bat"
BuildForRid "win-x64" "stable-x86_64" "buildx86_64.bat"

# Set the buildCiRunNumber and buildCiSuffix variables
$buildCiRunNumber = if ($args.Count -ge 1) { $args[0] } else { "0" }
$buildCiSuffix = if ($args.Count -ge 2) { $args[1] } else { "" }
$buildCiSuffix = $buildCiSuffix -replace '[^a-zA-Z]+', '-'
# Pack it all up
dotnet pack IronRure.Batteries-Windows.csproj -c Release -o bin\artifacts /p:BuildCiRunNumber=$buildCiRunNumber /p:BuildCiBranchSuffix=$buildCiSuffix
