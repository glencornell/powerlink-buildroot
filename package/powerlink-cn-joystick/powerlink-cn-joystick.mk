################################################################################
#
# powerlink-cn-joystick
#
################################################################################

POWERLINK_CN_JOYSTICK_VERSION = 42cabe259ae72aee60fc9c4ff6a222711d432c1c
POWERLINK_CN_JOYSTICK_SITE = $(call github,glencornell,powerlink-cn-joystick,$(POWERLINK_CN_JOYSTICK_VERSION))

POWERLINK_CN_JOYSTICK_LICENSE = LGPL-3.0+
POWERLINK_CN_JOYSTICK_LICENSE_FILES = COPYING.LESSER
POWERLINK_CN_JOYSTICK_INSTALL_STAGING = YES

POWERLINK_CN_JOYSTICK_DEPENDENCIES = libpcap ncurses
POWERLINK_CN_JOYSTICK_AUTORECONF = YES

$(eval $(autotools-package))
