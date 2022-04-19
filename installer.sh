#!/bin/bash

sudo apt install fd-find fzf
curl https://sh.rustup.rs -sSf | sh
cargo install --locked navi
cargo install feroxbuster rustscan
navi repo add esp0xdeadbeef/cheat.sheets
echo 'eval "$(navi widget zsh)"' >> .zshrc
echo 'eval "$(navi widget bash)"' >> .bashrc
echo " Installation Done ! Enjoy Our Tool "
