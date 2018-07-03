#!/bin/bash

# Setup the dotfiles! This script should run on-demad and usually during setup
# or when things have just changed.

########## Variables
dotfilesDir="${GOPATH}/src/github.com/${GITUSER}/dotfiles"
#dotfilesDir=~/.dotfiles                    # dotfiles directory
olddir=${dotfilesDir}_old             # old dotfiles backup directory
files="vimrc tmux.conf zshrc private"    # list of files/folders to symlink in homedir
##########

# Link the Alacritty config file
mkdir -p ~/.config/alacritty
ln -s ${dotfilesDir}/alacritty.yml ~/.config/alacritty/alacritty.yml

# Link our vim init file
ln -s ${dotfilesDir}/init.vim ~/init.vim

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ${dotfilesDir} ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dotfilesDir directory ..."
cd ${dotfilesDir}
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ${olddir}/
    echo "Creating symlink to $file in home directory."
    ln -s $dotfilesDir/$file ~/.$file
done

# install antigen zsh plugin manager
#curl -L git.io/antigen > ~/antigen.zsh

# install vim-go  
rm -rf ~/.vim/pack/plugins/start/vim-go
mkdir -p ~/.vim/pack/plugins/start
git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
