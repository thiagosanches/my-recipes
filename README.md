# my-recipes

[![make test](https://github.com/thiagosanches/my-recipes/actions/workflows/make-test.yml/badge.svg?branch=master)](https://github.com/thiagosanches/my-recipes/actions/workflows/make-test.yml)

### How it works?

The `linux` folder represents my `$HOME` directory on the host machine. So, everything under this folder, it will be created a symbolic link on the proper places, using the folder convention. For example:

GitHub: `linux/.config/i3/config` -> Host machine: `~/.config/i3/config`.

There are 2 important files that are executed under the `make` command. One, that removes all the links (unlink.sh) and the other that recreates all the symbolic links (link.sh).

### How to run it?
- You can run: `make test` and/or `make (link|unlink)`.

### WORK IN PROGRESS - THE STEPS BELOW IS DEPRECATED!

This repository includes:

* Recipes to a "hybrid" system: Windows 10 and Linux side by side (WSL 2).
* Helper scripts that I've built.


# First steps

### Windows
Run the following command to enable the WSL, install chocolatey and apply the `general-development` recipe.

```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

Set-ExecutionPolicy AllSigned; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

(New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/thiagosanches/my-recipes/master/windows/general-development.config') > general-development.config

choco install --force --yes general-development.config
```

### Linux 
> It could be used only in Linux as well.

Run the following command to bootstrap the environment:

`curl  https://raw.githubusercontent.com/thiagosanches/my-recipes/master/init.sh -O init.sh`

`./init.sh <your folder goes here>`
