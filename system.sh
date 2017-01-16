#!/bin/sh

# Symlink Config Files
ln -sfv  "`pwd`/config/dot.laptop.local" "~/.laptop.local"
ln -sfv  "`pwd`/config/dot.gitignore_global" "~/.gitignore_global"
ln -sfv  "`pwd`/config/dot.gitconfig" "~/.gitconfig"
