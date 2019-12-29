#----------------------------------------------------------------------------
# make gergo:cyphus:dfu
# Make sure you have dfu-programmer from Homebrew installed.
#----------------------------------------------------------------------------

# See
# https://github.com/qmk/qmk_firmware/blob/master/docs/config_options.md#the-rulesmk-file
# for more information on rules.mk configuration options

# Firmware options
NKRO_ENABLE     = yes  # Enable NKRO
EXTRAKEY_ENABLE = yes  # Enable audio control and system control keys

# Debug optoins
VERBOSE 		= no
CONSOLE_ENABLE  = no
DEBUG_ENABLE    = no
# Print out a row and col for each key detected in the keyboard matrix
DEBUG_MATRIX    = no

# Skip baking in the git version and build date
SKIP_VERSION    = no  # defined in top-level Makefile
SRC += matrix.c i2c_master.c

# DEBUG_MATRIX is defined in keyboards/gergo/matrix.c, and therefore the rule
# for how to apply the option has to be specified manually.
ifeq ($(strip $(DEBUG_MATRIX)), yes)
    OPT_DEFS += -DDEBUG_MATRIX
endif
