#!/bin/sh

# Symlink Config Files
ln -sfv  "`pwd`/config/.gitconfig" $HOME/.gitconfig
ln -sfv  "`pwd`/config/.gitignore_global" $HOME/.gitignore_global
