# if not administrator, we start new process with administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")){ Start-Process powershell.exe " -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# install software
# programing
choco install ninja llvm microsoft-windows-terminal powershell-core v2rayn vscode sumatrapdf git git-lfs.install cmake ripgrep grep fd shellcheck -y

# system
choco install universal-usb-installer -y

# music, video
choco install netease-cloudmusic potplayer telegram itunes sharpkeys powertoys -y

# tools
choco install everything windbg processhacker.portable obs-studio f.lux.install blender googlechrome teamviewer -y

# config emacs
cmd /c mklink /D %appdata%/.doom.d ../../../doom_emacs

Pause