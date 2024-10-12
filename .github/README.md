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

