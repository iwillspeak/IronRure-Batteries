# IronRure-Batteries

[![MIT License](https://img.shields.io/github/license/iwillspeak/IronRure-Batteries.svg)](https://github.com/iwillspeak/IronRure-Batteries/blob/master/LICENSE)


| Runtimes         | Nuget package | Build         |
| ---------------  | ------------- | ------------- |
| windows          | [![NuGet version](https://badge.fury.io/nu/IronRure.Batteries-Windows.svg)](https://badge.fury.io/nu/IronRure.Batteries-Windows)  | [![Build Status](https://github.com/iwillspeak/IronRure-Batteries/actions/workflows/ci.yml/badge.svg)](https://github.com/iwillspeak/IronRure-Batteries/actions/workflows/ci.yml) |
| linux            | [![NuGet version](https://badge.fury.io/nu/IronRure.Batteries-Linux.svg)](https://badge.fury.io/nu/IronRure.Batteries-Linux)      | [![Build Status](https://github.com/iwillspeak/IronRure-Batteries/actions/workflows/ci.yml/badge.svg)](https://github.com/iwillspeak/IronRure-Batteries/actions/workflows/ci.yml) |
| osx              | [![NuGet version](https://badge.fury.io/nu/IronRure.Batteries-Darwin.svg)](https://badge.fury.io/nu/IronRure.Batteries-Darwin)    | [![Build Status](https://github.com/iwillspeak/IronRure-Batteries/actions/workflows/ci.yml/badge.svg)](https://github.com/iwillspeak/IronRure-Batteries/actions/workflows/ci.yml) |


Nuget Package of Rust Regex C API.

This repository contains pre-built versions of the rust regex library for Windows, Linux and macOS. You shouldn't need to add a reference to these libraries yourself, they're referenced from [`IronRure`](https://github.com/iwillspeak/IronRure). It might come in useful if you need to target a new platform though.

## About the Version Number

The NuGet package number for this library is a little odd. It contians the packed version number from the regex crate upstream, followed by a single version number for the library, and a build suffix based on the build ID.

This should ensure that nuget package versions will incremnet if either we start trackign a more up to date build of regex, or if the package needs to make feature chagnes.

## Contributing

IronRure is open source. Pull requests are welcome. See the [Contributing Guidelines][contributing] and [Code of Conduct][coc] for more information.

## Windows Gotchas

The windows build requires the `vc140` redistributable to work. This means you need to have Visual Studio 2015 or the [Visual Studio 2015 C++ Runtime](https://www.microsoft.com/en-gb/download/details.aspx?id=48145) installed for it to load. If not you'll get an exception which claims that `rure.dll` can't be found.
