#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

files=(
    ".aliases"
    ".bash_profile"
    ".bash_prompt"
    ".bashrc"
    ".curlrc"
    ".editorconfig"
    ".gitconfig"
    ".gitignore"
    ".p10k.zsh"
    ".screenrc"
    ".tmux.conf"
    ".wgetrc"
    ".zshrc"
)

function doIt() {
    for i in "${files[@]}"
    do
        ln -s ".dotfiles/$i" ~
    done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This will create symlinks in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
