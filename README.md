# Embedded Zig Drivers Library

`ezdl` is a library or framework to write applications for embedded devivces in
[Zig](https://ziglang.org). It is device agnostic, and currently contains components for certain
STM32 and MSP430 chips and boards.

## Architecture

`ezdl` reflects the common chip architecture where IP blocks such as GPIO, serial or ADC components
are combined to form a member of a larger device family. Instead of implementing higher layers of
the embedded software stack separately for each chip in a device family, `ezdl` reuses the software
components which correspond to hardware blocks by using three different layers.

### SVD generated code

On the lowest layer is the direct translation of the SVD device description into Zig with the help
of [regz](https://github.com/ZigEmbeddedGroup/regz). This code is chip specific, but in theory, it
would be possible to also extract common structures into a reusable collection.

### MCU peripherals

The next layer is formed by generic components implementing common functions over hardware blocks,
e.g. common UART or GPIO functionality is encapsulated into separate structures. The implementation
is based on the SVD generated code and makes heavy use of duck typing in Zig: Each structure within
the MCU peripherals layer accepts an `anytype` parameter which is an SVD generated component. These
form new types at Zig `comptime`, and access to the SVD code is resolved at compile time.

### MCUs

Multiple MCU peripherals are combined into MCUs. An MCU does not require own code but is simply
composed of a set of peripherals.


## Boards

It is possible to use `ezdl` without using a board, but in most cases, the combination of an MCU
with external peripherals, and the resulting configuration of the MCU is reflected in a hardware
board. A board is usually instantiating the MCU peripherals with the peripheral instances from the
SVD layer.

## Usage

`ezdl` offers convenience functions to add the framework to an application in the `build.zig` file.
These functions generate build steps to load a board definition and generate a linker script, and
add the board and `ezdl` itself as packages to the application.

`ezdl` needs to be located within the application's source tree, it can either be behind a symbolic
link, checked out via git into the source tree, or added as a git submodule.
