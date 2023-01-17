$wallpaper = "$env:APPDATA\Microsoft\Windows\Themes"
Remove-Item $wallpaper\TranscodedWallpaper
Copy-Item C:\Users\olai.boe\Documents\GitHub\OlaiOS-Testing-Repo\AdditionalContent\TranscodedWallpaper $wallpaper
Stop-Process -n explorer
c:\windows\explorer.exe
exit