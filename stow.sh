#! /bin/sh

# TODO: check GNU stow is installed

CONFIG_DIR="$HOME/.config"

# Emacs
stow -t "$HOME" Emacs

# Tmux
stow -t "$HOME" tmux

# Alacritty
mkdir -p "$CONFIG_DIR/alacritty"
stow -t "$CONFIG_DIR/alacritty" Alacritty

# Helix Editor
mkdir -p "$CONFIG_DIR/helix"
stow -t "$CONFIG_DIR/helix" Helix

# Fish Shell
mkdir -p "$CONFIG_DIR/fish"
stow -t "$CONFIG_DIR/fish" --adopt Fish

# Golang
mkdir -p "$CONFIG_DIR/go"
stow -t "$CONFIG_DIR/go" Golang
