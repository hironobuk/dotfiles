#!/usr/bin/env bash

set -euo pipefail

dotfiles_dir="$(git rev-parse --show-toplevel)"

brew bundle --file Brewfile

case "$(uname -s)" in
  Darwin)
    brew bundle --file Brewfile.mac
    ;;
  Linux)
    brew bundle --file Brewfile.linux
    ;;
esac

mkdir -p \
  "${HOME}/.config/nvim/after/syntax" \
  "${HOME}/.vim/after/syntax"

cp "${dotfiles_dir}/.vimrc" \
  "${HOME}/.vimrc"

cp "${dotfiles_dir}/.config/nvim/init.lua" \
  "${HOME}/.config/nvim/init.lua"

cp "${dotfiles_dir}/.config/nvim/nvim-pack-lock.json" \
  "${HOME}/.config/nvim/nvim-pack-lock.json"

cp "${dotfiles_dir}/.vim/ng-template.vim" \
  "${HOME}/.vim/after/syntax/html.vim"

cp "${dotfiles_dir}/.vim/ng-template.vim" \
  "${HOME}/.config/nvim/after/syntax/html.vim"
