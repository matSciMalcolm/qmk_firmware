# Gergo Custom Keymap by Cyphus

Personal layout customization of https://www.gboards.ca/product/gergo.

## Compiling the firmware

### Local build

Run the following to install the tools

```
brew tap osx-cross/avr
brew tap PX4/homebrew-px4
brew install avr-gcc@8
brew link --force avr-gcc@8
brew install jq dfu-programmer dfu-util gcc-arm-none-eabi avrdude
```

Setup submodules by running `make git-submodule`. Then you can run `make
gergo:cyphus` to build the keyboard firmware under `.build`, or run `make
gergo:cyphus:flash` to attempt to flash the firmware after it's built.

### Docker Build (cannot flash without docker machine, not recommended for macOS)

```
docker pull qmkfm/base_container
util/docker_build.sh gergo:cyphus
```

The output hex file can then be found under the `.build` directory in the
repository root.

## Customizing the layout

* Go to https://config.qmk.fm/#/gergo/LAYOUT_gergo
* Click the upload button next to `KEYMAP.JSON`
* Upload gergo_layout.json from this repo.
* Customize as you see fit.
* When finished, click the download button next to `KEYMAP.JSON`
* Format the downloaded json with jq and regenerate keymap.c:
  ```
  # Assuming the layout JSON is saved to ~/Downloads
  cd keyboards/gergo/keymaps
  jq ~/Downloads/gergo_layout.json > gergo_layout.json
  python3 ./generate_layout.py gergo_layout.json keymap.c
  ```

## (Unorganized) Thoughts on Layout

* Useful to have Cmd/Win key on both sides to support things like:
  * Command-clicking on things.
  * Hitting Cmd+Tab with one hand
  * Inserting emoji (Cmd+Ctrl+Space) 😀
* I have nothing mapped to row 7, column 2 of my layout because that switch
  is permanently shorted on my keyboard and therefore not usable.
* For numbers and symbols, I turned the right keyboard into a numpad on layer
  1, and put the symbols that go above the numbers across the top row of
  layers 1 and 2, similar to how they are on an ANSI keyboard. It just so
  happened to work out that the symbols `& * (` on layer 2 use the same keys as
  `7 8 9` on layer 1.
