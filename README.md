<div align="center">

# 🗃️ FontInstaller

</div>

<div align="center">

A font installer script for Windows

</div>

## Usage

### Install multiple fonts in bulk

To install a font, simply specify the path of the font file as the first argument. This script resolves the path automatically, so you can specify wild card e.g. `*.ttf`.

```powershell
❯ Install-Font.ps1 Somefont/             # Directory path
❯ Install-Font.ps1 path/to/SomeFont*.ttf # File path includes wild card
```

### Install from zip archive

When this script finds the zip file, it automatically extract the zip file to a temporary directory and installs all the fonts stored in it.

```powershell
❯ Install-Font.ps1 Somefont.zip
```

### Show already installed fonts list

To see a list of already installed fonts, run `Get-Font.ps1`.
You can narrow the list by specifying the `-Name`, `-Path` parameter.

```
❯ Get-Font.ps1 -Name udev

Name               Path
----               ----
UDEV Gothic 35NF   C:\Windows\Fonts\UDEV Gothic 35NF
UDEV Gothic 35NFLG C:\Windows\Fonts\UDEV Gothic 35NFLG
UDEV Gothic NF     C:\Windows\Fonts\UDEV Gothic NF
UDEV Gothic NFLG   C:\Windows\Fonts\UDEV Gothic NFLG
```

## Installation

Clone or download this repository. Otherwise download the archive from the [latest release](https://github.com/sheepla/FontInstaller/releases/latest) page then extract it.

To run local PowerShell script on Windows, execution policy changes are required.
Run the following with Administrator privileges.

```powershell
# PowerShell (Administrator)
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## LICENSE

[MIT](./LICENSE)

