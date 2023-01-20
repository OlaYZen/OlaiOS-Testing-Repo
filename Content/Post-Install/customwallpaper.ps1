$newwallpaper = "C:\Users\olai.boe\Documents\GitHub\OlaiOS-Testing-Repo\Content\Images\Wallpaper\Wallpaper Gen1.png"
$wallpaper = "$env:APPDATA\Microsoft\Windows\Themes"
$newwallpaperlocation = "$wallpaper\*.png"
Remove-Item "$wallpaper\TranscodedWallpaper"
Copy-Item $newwallpaper $wallpaper
Rename-Item $newwallpaperlocation "TranscodedWallpaper"
Set-ItemProperty -path "HKCU:\Control Panel\Desktop" -Name "WallPaper" -Value $newwallpaper


Stop-Process -n explorer
Stop-Process -n explorer
Stop-Process -n explorer
Stop-Process -n explorer
Stop-Process -n explorer
Stop-Process -n explorer
c:\windows\explorer.exe