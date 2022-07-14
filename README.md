# my-recipes

[![make test](https://github.com/thiagosanches/my-recipes/actions/workflows/make-test.yml/badge.svg?branch=master)](https://github.com/thiagosanches/my-recipes/actions/workflows/make-test.yml)


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
