$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$home\Desktop\DisableCustomFeatures.lnk")
$Shortcut.TargetPath="C:\Users\olai.boe\Documents\GitHub\OlaiOS-Testing-Repo\Additional-Content\DisableCustomFeaturesGUI.ps1"
$Shortcut.IconLocation="C:\Users\olai.boe\Documents\GitHub\OlaiOS-Testing-Repo\Additional-Content\DisableCustomFeaturesLogo.ico"
$Shortcut.Save()