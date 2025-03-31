#!/bin/bash

echo "🚀 Initializing developer environment..."

# NVM
if ! command -v nvm &>/dev/null; then
	echo "🧙 Installing NVM..."
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
else
	echo "✅ NVM already installed"
fi

# Node + PNPM/Yarn
nvm install --lts
nvm use --lts

echo "📦 Installing global packages..."
npm install -g yarn pnpm eslint prettier

# Git config
git config --global core.editor "code --wait"

# Create Projects folder
mkdir -p "$HOME/Projects"

echo "✅ Dev environment ready to go!"
