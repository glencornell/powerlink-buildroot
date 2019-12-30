# powerlink-buildroot

Build system for real-time, embedded Linux Ethernet POWERLINK devices.

The purpose of this project is to provide a collection of pre-configured Ethernet POWERLINK devices such as encoders, electric motor drives, joysticks, etc. conformant to the CiA CanOpen device profiles that you can install on common hardware platforms.  As a result, the goal here is to provide the building blocks for a distributed, synchronous control system.

This project is based upon the following:

* [Buildroot](https://buildroot.org/)
* [Buildroot-submodule](https://github.com/Openwide-Ingenierie/buildroot-submodule)
* [PREMPT_RT Linux kernel patch](https://wiki.linuxfoundation.org/realtime/documentation/howto/applications/preemptrt_setup)
* [openPOWERLINK](http://openpowerlink.sourceforge.net/web/)

## System Description

This project is intended to simplify the configuration process. Consequently, the configuration options are limited so that all systems interoperate.  The following section describes the system and some of its limitations.

### Real-Time (PREEMPT_RT)

The PREEMPT_RT patch set is applied to the Linux kernel to acheive deterministic scheduling.  The patch is applied using the ```BR2_LINUX_KERNEL_PATCH``` buildroot defconfig variable.  Be mindful of the strong dependency of the PREEMPT_RT patch to the Linux kernel version when upgrading your Linux kernel.

To test your configuration, install the packages that follow.  Note that they are optional.

```
BR2_PACKAGE_RT_TESTS=y
BR2_PACKAGE_STRESS=y
```

The kernel is configured with the folowing options:

```
CONFIG_PREEMPT_RT_FULL=y
CONFIG_HIGH_RES_TIMERS=y
```

### Ring Network Architecture (HSR)

The POWERLINK network defined here is set up as a ring architecture for seamless redundancy using [IEC 62439-3 High-availability Seamless Redundancy (HSR)](https://en.wikipedia.org/wiki/High-availability_Seamless_Redundancy).  Therefore, each POWERLINK node must have two Ethernet ports.  Make sure that you have the appropriate hardware.  The Linux kernel is configured as follows:

```
CONFIG_HSR=Y
```

TODO: add details on configuring a linux system for HSR.

### Secure Software Update (swupdate)

TODO: describe swupdate configuration

### Ethernet POWERLINK

TODO: describe openpowerlink confguration

## Boards

This build system follows the guidelines for adding new hardware and system configurations as found in the [buildroot documentation](https://buildroot.org/downloads/manual/manual.html).  Please read the documents to learn how to tailor it for your specific needs or to add your own hardware.

Presently, the following boards are supported:

* pc_x86_64_efi - a generic PC, EFI-based, x86_64 platform

## Applications



## Building

```
# Create the defconfig file:
make pc_x86_64_rt_powerlink_mn_defconfig

# Customize to suit your needs:
make menuconfig

# Build
make
```
