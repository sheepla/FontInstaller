# FontInstaller

A font installer for Windows

## Usage

To install fonts, just specify font file path in first argument.
It will resolve the path automatically so you can glob pattern e.g. `*.ttf`

```powershell
❯ Install-Font.ps1 path/to/SomeFont*.ttf
```

To see a list of already installed fonts, run `Get-Fonts.ps1`.
You can narrow the list by specifying the `-Name`, `-Path`, `-ModifyDate` parameter.

```
❯ Get-Font.ps1 -Name biz

Name            Path                                  ModifyDate
----            ----                                  ----------
BIZ UDゴシック  C:\Windows\Fonts\BIZ UDゴシック       1899/12/30 0:00:00
BIZ UDPゴシック C:\Windows\Fonts\BIZ UDPゴシック      1899/12/30 0:00:00
BIZ UD明朝 中   C:\Windows\Fonts\BIZ UDMincho Medium  1899/12/30 0:00:00
BIZ UDP明朝 中  C:\Windows\Fonts\BIZ UDPMincho Medium 1899/12/30 0:00:00
```

## Installation

Clone or download this repository. 
To run local PowerShell script on Windows, run the following with Administrator privileges.

```powershell
# PowerShell (Administrator)
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## LICENSE

MIT
