# my-recipes
This contains all my config files (dotfiles) and/or some useful bash scripts (at least for me haha)! The idea is to always have the configuration files synced up in order to make it faster to reconfigure the host machine.

[![make test](https://github.com/thiagosanches/my-recipes/actions/workflows/make-test.yml/badge.svg?branch=master)](https://github.com/thiagosanches/my-recipes/actions/workflows/make-test.yml)

### How it works?

The `linux` folder represents my `$HOME` directory on the host machine. So, everything under this folder, it will be created a symbolic link on the proper places, using the folder convention. For example:

GitHub: `linux/.config/i3/config` -> Host machine: `~/.config/i3/config`.

There are 2 important files that are executed under the `make` command. One, that removes all the links (`unlink.sh`) and the other that recreates all the symbolic links (`link.sh`) and creates the folder structure, if needed.

In other words: You just have to put the config file under the linux folder, following the directory structure that you want and you should be good!

### How to run it?
- You can run: `make test` and/or `make (link|unlink)`.
- For `make test` it will execute `shellchecker` against all the shell script files, there is a GitHub action that performs the same step on every push.

### What to do next?
- Run: `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`. On `vim`, you have to enter on it and type: `PlugInstall`.
- It's important to keep the personal things on the `~/r` folder.
- It's important to keep the work things on the `~/r/github` folder.
- Create the following file: `~/.my-quick-notes.txt` and place everything that you need at hand.
