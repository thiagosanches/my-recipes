# my-recipes
My Windows 10 and Linux recipes.

# First steps

### Windows
Run the following command to install the chocolatey and the `general-development` recipe.

```
Set-ExecutionPolicy AllSigned; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

(New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/thiagosanches/my-recipes/master/windows/general-development.config') > general-development.config

choco install --force --yes general-development.config
```

### Linux 
Run the following command to bootstrap the environment:

`curl  https://raw.githubusercontent.com/thiagosanches/my-recipes/master/init.sh | bash`
