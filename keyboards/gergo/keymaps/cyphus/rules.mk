#----------------------------------------------------------------------------
# make gergo:cyphus:dfu
# Make sure you have dfu-programmer installed!
#----------------------------------------------------------------------------

# Firmware options
NKRO_ENABLE         = yes  # Enable NKRO
EXTRAKEY_ENABLE     = yes  # Enable audio control and system control keys

SRC += matrix.c i2c_master.c
