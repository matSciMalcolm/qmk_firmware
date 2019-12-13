# Gergo Custom Keymap by Cyphus

Personal layout customization of https://www.gboards.ca/product/gergo.

## Compiling the firmware

### Repo setup
Start by cloning the qmk_firmware[git repo][qmk_firmware].

```
git clone https://github.com/qmk/qmk_firmware.git
```

Setup submodules by running `make git-submodule`

### Docker Build

```
docker pull qmkfm/base_container
util/docker_build.sh gergo:cyphus
```

The output hex file can then be found under the `.build` directory in the
repository root.

### Local build

Run the following to install the tools

```
brew tap osx-cross/avr
brew tap PX4/homebrew-px4
brew update
brew install avr-gcc@8
brew link --force avr-gcc@8
brew install jq dfu-programmer dfu-util gcc-arm-none-eabi avrdude
```

Then you can run `make gergo:cyphus` to build the keyboard firmware under
`.build`, or run `make gergo:cyphus:flash` to attempt to flash the firmware
after it's built.

## Customizing the layout

* Go to https://config.qmk.fm/#/gergo/LAYOUT_gergo
* Click the upload button next to `KEYMAP.JSON`
* Upload gergo_layout.json from this repo.
* Customize as you see fit.
* When finished, click the download button next to `KEYMAP.JSON`
* Format the downloaded json with jq and regenerate keymap.c:
  ```
  # Assuming the layout JSON is saved to ~/Downloads
  jq ~/Downloads/gergo_layout.json > keyboards/gergo/keymaps/cyphus/gergo_layout.json
  keyboards/gergo/keymaps/cyphus/generate_layout.py !$ keyboards/gergo/keymaps/cyphus/keymap.c
  ```

## (Unorganized) Thoughts on Layout

* Useful to have Cmd/Win key on both sides to support things like:
  * Command-clicking on things.
  * Hitting Cmd+Tab with one hand
  * Inserting emoji (Cmd+Ctrl+Space) 😀
* Not sure what's going on with the Play/Pause media key (`KC_MPLY` aka
  `KC_MEDIA_PLAY_PAUSE`) defined [here][KC_MPLY].
  * Microsoft's [keycodes page][VK_MEDIA_PLAY_PAUSE] lists
    `VK_MEDIA_PLAY_PAUSE` as `0xB3`, which is different than the keycode set by
    QMK (`0xAE`).
  * I have another keyboard (NightFox) that has a working Play/Pause key.
  * From testing with Wireshark it appears the NightFox is sending a special
    sequence of USB packets for the play pause key as a "Consumer Control
    Device".
    * The code for NightFox controller that sets up a consumer control
      character to be sent is defined [here][Output_consCtrlSend_capability].
    * The code to actually send the keycodes is defined in the
      [`usb_keyboard_send` function][usb_keyboard_send].
  * Further Wireshark testing shows no keyboard codes sent when `KC_MPLY` is
    pressed.
  * I'm still looking into what the keycode is supposed to be for macOS.

[qmk_firmware]: https://github.com/qmk/qmk_firmware/
[KC_MPLY]: https://github.com/qmk/qmk_firmware/blob/master/tmk_core/common/keycode.h#L175
[VK_MEDIA_PLAY_PAUSE]: https://docs.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes#VK_MEDIA_PLAY_PAUSE
[Output_consCtrlSend_capability]: https://github.com/kiibohd/controller/blob/f3af41c46fc72c26015cbdc1c1189f3d20842e94/Output/USB/output_usb.c#L263-L302
[usb_keyboard_send]: https://github.com/kiibohd/controller/blob/f3af41c46fc72c26015cbdc1c1189f3d20842e94/Output/USB/arm/usb_keyboard.c#L203
