# Powershell profile

## Location

```powershell
echo $PROFILE.CurrentUserAllHosts
```

## Requirements

- Oh My Posh [[Website](https://ohmyposh.dev/docs/installation/windows)]

  - Windows

  ```powershell
  winget install JanDeDobbeleer.OhMyPosh -s winget 
  ```

  - macOS & Linux

  ```bash
  brew install jandedobbeleer/oh-my-posh/oh-my-posh 
  ```

- posh-git [[Github](https://github.com/dahlbyk/posh-git#installation)]

```powershell
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
```

<!-- - Get-ChildItemColor [Github](https://github.com/dahlbyk/posh-git#installation)

```powershell
Install-Module Get-ChildItemColor
``` -->

- ZLocation [[Github](https://github.com/vors/ZLocation)]

```powershell
Install-Module ZLocation -Scope CurrentUser
```

- Terminal-Icons [[Github](https://github.com/devblackops/Terminal-Icons)]

```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery
```

- thefuck [[Github](https://github.com/nvbn/thefuck)]

  Generic way of installation (If not working go [here](https://github.com/nvbn/thefuck/wiki/Installation))

```powershell
pip install --user thefuck
```

- PSUtil [[Github](https://github.com/PowershellFrameworkCollective/PSUtil)]

```powershell
Install-Module PSUtil
```

- PSWriteHTML [[Github](https://github.com/EvotecIT/PSWriteHTML)]

```powershell
Install-Module -Name PSWriteHTML -AllowClobber -Force
```

<!-- - zoxide [Github](https://github.com/ajeetdsouza/zoxide)

```powershell
curl.exe -A "MS" https://webinstall.dev/zoxide | powershell
``` -->
