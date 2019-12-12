#----------------------------------------------------------------------------
# make gergo:cyphus:dfu
# Make sure you have dfu-programmer from Homebrew installed.
#----------------------------------------------------------------------------

# See
# https://github.com/qmk/qmk_firmware/blob/master/docs/config_options.md#the-rulesmk-file
# for more information on rules.mk configuration options

# Firmware options
NKRO_ENABLE         = yes  # Enable NKRO
EXTRAKEY_ENABLE     = yes  # Enable audio control and system control keys

SRC += matrix.c i2c_master.c
