#pragma once

// this makes it possible to do rolling combos (zx) with keys that convert to
// other keys on hold (z becomes ctrl when you hold it, and when this option
// isn't enabled, z rapidly followed by x actually sends Ctrl-x. That's bad.)
#define IGNORE_MOD_TAP_INTERRUPT
#define OLED_FONT_H "keyboards/gergo/keymaps/oled/glcdfont.c"
