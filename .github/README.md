# My Dotfiles

## Installation

The expected use case is an Arch Linux installation with Sudo setup for the user account. Then follow the following steps:

1. Run setup script with:

- ```
  bash <(curl https://raw.githubusercontent.com/mcttn22/dotfiles/refs/heads/main/.github/setup.sh)
  ```

2. Apply the following manual configuration:

- Replace monitor name in ~/.config/hypr/hyprland.conf and ~/.config/hypr/hyprpaper.conf with name outputted by `hyprctl monitors all`
- Set wallpaper and lockscreen by creating the following symlinks:
  - ```ln -s path-to-image ~/Pictures/wallpaper```
  - ```ln -s path-to-image ~/Pictures/lock-screen```
  - Either reboot or switch virtual console and run `sudo systemctl restart sddm` to apply changes
- Add --location flag with value (e.g. Postcode) to wttrbar command in ~/.config/waybar/config.jsonc for acurate weather
- *Note: Some applications such as Discord display pixelated on Wayland unless you add the `--enable-features=UseOzonePlatform --ozone-platform=wayland` flag to their executable. This can be done by adding a desktop file with the flag to .local/share/applications/*

## Updating

You can keep up to date with the latest configuration by running `dotfiles pull`

