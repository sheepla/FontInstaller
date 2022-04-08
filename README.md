<div align="center">

# 🗃️ FontInstaller

</div>

<div align="center">

A font installer script for Windows

</div>

## Usage

To install fonts, just specify font file path in first argument.
This script resolve the path automatically so you can use glob pattern e.g. `*.ttf`

```powershell
❯ Install-Font.ps1 path/to/SomeFont*.ttf
```

To see a list of already installed fonts, run `Get-Fonts.ps1`.
You can narrow the list by specifying the `-Name`, `-Path` parameter.

```
❯ Get-Font.ps1 -Name plemol

Name               Path
----               ----
UDEV Gothic 35NF   C:\Windows\Fonts\UDEV Gothic 35NF
UDEV Gothic 35NFLG C:\Windows\Fonts\UDEV Gothic 35NFLG
UDEV Gothic NF     C:\Windows\Fonts\UDEV Gothic NF
UDEV Gothic NFLG   C:\Windows\Fonts\UDEV Gothic NFLG
```

## Installation

Clone or download this repository. Or download the archive from [latest release](https://github.com/sheepla/FontInstaller/releases/latest) page then extract it.

To run local PowerShell script on Windows, execution policy changes are required.
Run the following with Administrator privileges.

```powershell
# PowerShell (Administrator)
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## LICENSE

[MIT](./LICENSE)
