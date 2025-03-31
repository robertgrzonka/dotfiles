#!/bin/bash

set -e

### INSTALL SCRIPT FOR: Robcio's Warp Dotfiles 2025 💻✨

command -v brew >/dev/null 2>&1 || {
  echo >&2 "Homebrew not installed. Aborting."
  exit 1
}

# 1. ZSH & Oh My Zsh
if ! command -v zsh >/dev/null 2>&1; then
  echo "Installing zsh..."
  brew install zsh
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 2. Clone plugins
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
PLUGINS=(
  "zsh-users/zsh-autosuggestions"
  "zsh-users/zsh-syntax-highlighting"
  "zsh-users/zsh-completions"
)

for plugin in "${PLUGINS[@]}"; do
  name=$(basename "$plugin")
  target="$ZSH_CUSTOM/plugins/$name"
  if [ ! -d "$target" ]; then
    git clone https://github.com/$plugin "$target"
  fi
done

# 3. Starship prompt
if ! command -v starship >/dev/null 2>&1; then
  echo "Installing Starship prompt..."
  brew install starship
fi
mkdir -p ~/.config
cp ./starship.toml ~/.config/starship.toml

# 4. Brew packages
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 5. Backup current Brewfile
brew bundle dump --file=~/Brewfile-backup-$(date +%Y%m%d).txt --force

# 6. Install from Brewfile
brew bundle --file=./Brewfile

# VSCode Extensions
echo "📦 Installing VSCode extensions..."
if command -v code &>/dev/null; then
  while read -r extension; do
    echo "🔧 Installing $extension"
    code --install-extension "$extension"
  done <"$(dirname "$0")/vscode/vscode-extensions.txt"
else
  echo "⚠️ VSCode command-line tool not found (code). Make sure it's installed."
fi

# 7. Link dotfiles
DOTFILES=(.zshrc .aliases.zsh .exports.zsh .functions.zsh .gitconfig .gitignore_global .gitmessage)

for file in "${DOTFILES[@]}"; do
  ln -sf "$PWD/$file" "$HOME/$file"
  echo "Linked $file"
done

# 8. Warp theme (if Warp is installed)
mkdir -p "$HOME/.warp/themes"
cp ./warp-theme.json "$HOME/.warp/themes/robcio-hyper.json"

# 9. Link dotfiles
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"
ln -sf "$PWD/.aliases.zsh" "$HOME/.aliases.zsh"
ln -sf "$PWD/.exports.zsh" "$HOME/.exports"
ln -sf "$PWD/.functions.zsh" "$HOME/.functions"
ln -sf "$PWD/.gitconfig" "$HOME/.gitconfig"
ln -sf "$PWD/.gitignore_global" "$HOME/.gitignore_global"
ln -sf "$PWD/.gitmessage" "$HOME/.gitmessage"

echo "\n✨ Done! Now open Warp and choose your custom theme! \nReload terminal or run: source ~/.zshrc"
