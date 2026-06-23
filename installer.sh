#!/usr/bin/env bash

set -euo pipefail

nix profile install --impure \
  nixpkgs#fd \
  nixpkgs#fzf \
  nixpkgs#navi \
  nixpkgs#feroxbuster \
  nixpkgs#rustscan
navi repo add esp0xdeadbeef/cheat.sheets
# shellcheck disable=SC2016
grep -qxF 'eval "$(navi widget zsh)"' "$HOME/.zshrc" || echo 'eval "$(navi widget zsh)"' >> "$HOME/.zshrc"
# shellcheck disable=SC2016
grep -qxF 'eval "$(navi widget bash)"' "$HOME/.bashrc" || echo 'eval "$(navi widget bash)"' >> "$HOME/.bashrc"
echo " Installation Done ! Enjoy Our Tool "
