#!/usr/bin/env bash

source bootstrap_utils.sh

# Setup OSX
echo "Setup OSX"
./bootstrap_osx.sh

# Setup homebrew
echo "Setup homebrew"

./bootstrap_homebrew.sh

# Setup bash profile
echo "Setup bash profile"

clone Bash-it/bash-it .bash_it

rm -rf $HOME/.bash_it/plugins/enabled/*
rm -rf $HOME/.bash_it/completion/enabled/*
rm -rf $HOME/.bash_it/aliases/enabled/*

symlink_resource bash_profile
symlink_resource dir_colors 

symlink_bash_it_script aliases
symlink_bash_it_theme ralch

bash_it_reload

bash_it_enable_plugin ruby 
bash_it_enable_plugin fasd 
bash_it_enable_plugin ssh 
bash_it_enable_plugin tmux 
bash_it_enable_plugin osx 

bash_it_enable_completion bash-it
bash_it_enable_completion brew 
bash_it_enable_completion defaults 
bash_it_enable_completion gem 
bash_it_enable_completion git 
bash_it_enable_completion gulp 
bash_it_enable_completion npm 
bash_it_enable_completion packer 
bash_it_enable_completion pip 
bash_it_enable_completion rake 
bash_it_enable_completion ssh 
bash_it_enable_completion tmux 
bash_it_enable_completion vagrant 

# Setup Software 
echo "Configure Software"

# Configure git
symlink_resource gitconfig
symlink_resource git-authors

# Configure tmux
symlink_resource tmux.conf

# Configure atom
clone luan/atom-config .atom

# Configure vim
sudo pip3 install neovim

clone luan/vimfiles .vim

symlink_resource vimrc.local
symlink_resource vimrc.local.before
symlink_resource vimrc.local.plugins

$HOME/.vim/install

ln -s $HOME/.nvim $HOME/.vim
ln -s $HOME/.nvimrc $HOME/.vimrc

# Install and configure ruby
ruby-install ruby 2.1.7 --no-reinstall

chruby ruby-2.1.7
gem install bundler

symlink_resource pryrc 

# Replace plist
copy_plist org.pqrs.Karabiner.plist
copy_plist com.googlecode.iterm2.plist
