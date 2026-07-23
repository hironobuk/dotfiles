#!/usr/bin/env bash

set -euo pipefail

brew bundle --file Brewfile

case "$(uname -s)" in
  Darwin)
    brew bundle --file Brewfile.mac
    ;;
  Linux)
    brew bundle --file Brewfile.linux
    ;;
esac
