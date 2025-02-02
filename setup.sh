#!/bin/bash

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Set up XDG_CONFIG_HOME
export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

# Create symlinks for existing configurations
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"

zsh_cmd='
if [[ $- == *i* ]]; then
    exec /home/linuxbrew/.linuxbrew/bin/zsh
fi
'
echo "$zsh_cmd" >> "$HOME/.bashrc"

git clone https://github.com/justjokiing/nvim-conf.git "$XDG_CONFIG_HOME/nvim"

packages=(
  lazygit
  lsd
  zsh
  starship
  antigen
  neovim
  ripgrep
  npm
)

# Iterate over the array and install each package
for package in "${packages[@]}"; do
  echo "Installing $package..."
  /home/linuxbrew/.linuxbrew/bin/brew install "$package"
done

echo "Setup Complete."
exit 0
