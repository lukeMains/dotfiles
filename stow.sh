#! /bin/sh

# TODO: heck GNU stow is installed

# Alacritty
# TODO: check .config/alacritty dir exists
stow -t "$HOME/.config/alacritty" Alacritty

# Emacs
stow -t "$HOME" Emacs

# Tmux
stow -t "$HOME" tmux
