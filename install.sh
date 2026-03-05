#!/bin/bash

# Visual feedback colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}==> Starting vanilla-dots installation${NC}"

# Get the current directory (where the repo is located)
DOTFILES_DIR=$(pwd)

# 1. Prepare Neovim directory
mkdir -p "$HOME/.config/nvim"

# 2. Link Neovim (init.lua)
if [ -f "$HOME/.config/nvim/init.lua" ]; then
    echo -e "${YELLOW}Backing up existing Neovim config...${NC}"
    mv "$HOME/.config/nvim/init.lua" "$HOME/.config/nvim/init.lua.bak"
fi
ln -sf "$DOTFILES_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"
echo -e "${GREEN}[OK] Neovim configured${NC}"

# 3. Link tmux (.tmux.conf)
# Note: This links to the standard home directory location
if [ -f "$HOME/.tmux.conf" ]; then
    echo -e "${YELLOW}Backing up existing tmux config...${NC}"
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak"
fi
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
echo -e "${GREEN}[OK] tmux configured${NC}"

echo -e "${BLUE}==> Installation complete!${NC}"
