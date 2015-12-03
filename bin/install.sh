#!/bin/bash

# install.sh

# usage: $ ./install.sh HOSTNAME
# where HOSTNAME is the name of the directory in which a given 
# host's dotfiles reside in the dotfiles repository.

hostname=$1

cd $hostname

cp * ~
