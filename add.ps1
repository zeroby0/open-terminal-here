# Right-click this file and select `Run with PowerShell`
#
# Aravind Reddy V <aravind.reddy@iiitb.org>
# https://github.com/zeroby0/open-terminal-here
# This file is MIT licensed.


$ICON_URL  = "https://raw.githubusercontent.com/zeroby0/open-terminal-here/master/wt.ico"
$ICON_PATH = "$env:LOCALAPPDATA\wt_terminal"
$WT_PATH   = "$env:LOCALAPPDATA\Microsoft\WindowsApps\wt.exe"

# Download icon
New-Item -ItemType "directory" -Path    "$ICON_PATH"
Invoke-WebRequest  "$ICON_URL" -OutFile "$ICON_PATH\wt.ico"

# Add entry on folders
$REG_PATH = "HKCU:\Software\Classes\Directory\shell\wt_terminal"
New-Item -Path $REG_PATH -Value "Open in Terminal" -Force
New-Item -Path "$REG_PATH\command" -Value "$WT_PATH -d %V%" -Force
New-ItemProperty -Path $REG_PATH -Name "Icon" -Value "$ICON_PATH\wt.ico"

# Add entry inside folders
$REG_PATH = "HKCU:\Software\Classes\Directory\Background\shell\wt_terminal"
New-Item -Path $REG_PATH -Value "Open Terminal here" -Force
New-Item -Path "$REG_PATH\command" -Value "$WT_PATH -d %V%" -Force
New-ItemProperty -Path $REG_PATH -Name "Icon" -Value "$ICON_PATH\wt.ico"
