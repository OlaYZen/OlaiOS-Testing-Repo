function OlaYZen {
write-host "                                           "
write-host "==========================================="
write-host "==========================================="
write-host "                                           "
write-host "YYYY             YYYYZZZZZZZZZZZZZZZZZZZZZ "
write-host " Y::Y           Y::::::::::::::::::::::::Z "
write-host "  Y::Y         Y::YYYZZZZZZZZZZZZZZZZZ:::Z "
write-host "   Y::Y       Y::Y                 Z:::Z   "
write-host "    Y:::Y   Y:::Y                 Z:::Z    "
write-host "     Y:::Y Y:::Y                 Z:::Z     "
write-host "      Y:::Y:::Y                 Z:::Z      "
write-host "       Y:::::Y                Z:::Z        "
write-host "        Y:::Y                Z:::Z         "
write-host "        Y:::Y               Z:::Z          "
write-host "        Y:::Y             Z:::Z            "
write-host "        Y:::Y            Z:::Z             "
write-host "        Y:::Y           Z:::Z              "
write-host "        Y:::Y         Z:::ZZZZZZZZZZZZZZZZ "
write-host "        Y:::Y        Z:::::::::::::::::::Z "
write-host "        YYYYY        ZZZZZZZZZZZZZZZZZZZZZ "
write-host "                                           "
write-host "==========================================="
write-host "==========================================="
write-host "                                           "
write-host "                                           "
write-host "============= made by OlaYZen ============="
write-host "                                           "
}

OlaYZen

Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser


# $Version ="PRE-APLHA-0.01"
$OlaiOS ="C:\OlaiOS"
$OlaiOSImages ="$OlaiOS\Content\Images"
$OlaiOSPost = "$OlaiOS\Content\Post-Install"
#Main Folder
mkdir $OlaiOS

#Content Folder and all its belonging
mkdir "$OlaiOS\Content"
mkdir "$OlaiOSImages"
mkdir "$OlaiOSImages\Wallpaper"
mkdir "$OlaiOS\Content\Installer-Content"
mkdir "$OlaiOS\Content\Optimizer"
mkdir "$OlaiOSPost"

#Download the Wallpapers Online 
$source = 'https://raw.githubusercontent.com/OlaYZen/OlaiOS-V2/master/Content/Images/Wallpaper/WallpaperRGB.png'
$destination = "$OlaiOSImages\Wallpaper"
Invoke-WebRequest $source -OutFile "$destination\WallpaperRGB.png"

$source = 'https://raw.githubusercontent.com/OlaYZen/OlaiOS-V2/master/Content/Images/Wallpaper/Wallpaper20%Gen1.png'
$destination = "$OlaiOSImages\Wallpaper"
Invoke-WebRequest $source -OutFile "$destination\Wallpaper Gen1.png"




#Download the Post-Install Content
$source = 'https://raw.githubusercontent.com/OlaYZen/OlaiOS-V2/master/Content/Post-Install/install.reg'
$destination = "$OlaiOSPost"
Invoke-WebRequest $source -OutFile "$destination\install.reg"

$source = 'https://raw.githubusercontent.com/OlaYZen/OlaiOS-V2/master/Content/Post-Install/debloater.ps1'
$destination = "$OlaiOSPost"
Invoke-WebRequest $source -OutFile "$destination\debloater.ps1"

$source = 'https://raw.githubusercontent.com/OlaYZen/OlaiOS-V2/master/Content/Post-Install/DisableCustomFeaturesGUI.ps1'
$destination = "$OlaiOSPost"
Invoke-WebRequest $source -OutFile "$destination\DisableCustomFeaturesGUI.ps1"

$source = 'https://raw.githubusercontent.com/OlaYZen/OlaiOS-V2/master/Content/Images/DisableCustomFeaturesLogo.ico'
$destination = "$OlaiOSImages"
Invoke-WebRequest $source -OutFile "$destination\DisableCustomFeaturesLogo.ico"

$source = 'https://raw.githubusercontent.com/OlaYZen/OlaiOS-V2/master/Content/Post-Install/performance.ps1'
$destination = "$OlaiOSPost"
Invoke-WebRequest $source -OutFile "$destination\performance.ps1"

# Installs the Custom Regedit
Set-Location "$OlaiOSPost"
reg.exe import install.reg
Start-Sleep -s 3

#Set Custom Wallpaper
$newwallpaper = "$OlaiOSImages\Wallpaper\WallpaperRGB.png"
$wallpaper = "$env:APPDATA\Microsoft\Windows\Themes"
$newwallpaperlocation = "$wallpaper\*.png"
Remove-Item "$wallpaper\TranscodedWallpaper"
Copy-Item $newwallpaper $wallpaper
Rename-Item $newwallpaperlocation "TranscodedWallpaper"
Set-ItemProperty -path "HKCU:\Control Panel\Desktop" -Name "WallPaper" -Value $newwallpaper
Set-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" -Name "BackgroundHistoryPath0" -Value $newwallpaper

#Run the installer script
if (Get-Module -ListAvailable -Name Appx) {
    Write-Host "Appx is Installed"
    if (Get-Module -ListAvailable -Name Appx) {
        Import-Module Appx
    } 
} 
else {
    Write-Host "Appx is not installed, Installing ..."
    Install-Module Appx -force
    if (Get-Module -ListAvailable -Name Appx) {
        Import-Module Appx
    } 
}

#Debloats the System (Thanks to ChrisTitusTech)
Start-Process "$OlaiOSPost\debloater.ps1"



#Additional Content
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$home\Desktop\DisableCustomFeatures.lnk")
$Shortcut.TargetPath="$OlaiOSPost\DisableCustomFeaturesGUI.ps1"
$Shortcut.IconLocation="$OlaiOSImages\DisableCustomFeaturesLogo.ico"
$Shortcut.Save()

# Applocations Download
#Insert OlaiOS SHOP
#Insert OlaiOS Updater
