#pragma once

// These options are described in
// https://github.com/qmk/qmk_firmware/blob/master/docs/config_options.md

// Amount of time in milliseconds before a tap becomes a hold. Default 200
#define TAPPING_TERM 150
// Makes it possible to do rolling combos (zx) with keys that convert to other
// keys on hold, by enforcing the TAPPING_TERM for both keys.
#define IGNORE_MOD_TAP_INTERRUPT
// Makes tap and hold keys trigger the hold if another key is pressed before
// releasing, even if it hasn't hit the TAPPING_TERM
#define PERMISSIVE_HOLD
// Have NKRO on by default, can be turned off with Magic+N aka both shifts + N
#define FORCE_NKRO
