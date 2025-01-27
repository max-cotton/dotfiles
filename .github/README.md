# My Dotfiles

## Installation

1. Download the bare repository with:

- ```
  git clone --bare https://github.com/mcttn22/dotfiles.git ~/.dotfiles
  ```

2. Update files to .dotfiles contents with:

- ```
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
  ```

3. Apply new .bashrc file contents to current terminal session with:

- ```
  source ~/.bashrc
  ```

4. Only show tracked files with:

- ```
  dotfiles config --local status.showUntrackedFiles no
  ```

*Note: The autostart scripts expect an image ~/Pictures/maxwell-the-cat.png and the cava, firefox, kitty and ollama packages*

