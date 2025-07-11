# My Dotfiles

## Installation

The expected use case is an Arch Linux installation with Sudo setup for the user account. Then follow the following steps:

1. Run setup script with:

   ```
   bash <(curl https://raw.githubusercontent.com/mcttn22/dotfiles/refs/heads/main/.github/setup.sh)
   ```

2. Apply the following manual configuration:

    1. Replace the monitor name in ~/.config/hypr/hyprland.conf and ~/.config/hypr/hyprpaper.conf with the name outputted by `hyprctl monitors all`

    2. Set the wallpaper and lockscreen by creating the following symlinks:

      - ```
        ln -s path-to-image ~/Pictures/wallpaper
        ```

      - ```
        ln -s path-to-image ~/Pictures/lock-screen
        ```

    3. Add `location` flag with a value (e.g. Postcode) to `wttrbar` command in ~/.config/waybar/config.jsonc for accurate weather

    4. Apply changes with `sudo systemctl restart sddm`

    *Note: Some applications such as Discord appear pixelated on Wayland unless you add the `--enable-features=UseOzonePlatform --ozone-platform=wayland` flag to their executable. This can be done by adding a desktop entry with the flag to ~/.local/share/applications/*

## Updating

You can stay up to date with the latest configuration by running `dotfiles pull`

