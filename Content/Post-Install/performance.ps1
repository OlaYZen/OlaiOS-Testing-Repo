






$location = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects"
Set-ItemProperty -path "$location" -Name "VisualFXSetting" -Value "2"
Set-ItemProperty -path "$location\AnimateMinMax" -Name "WallPaper" -Value "0"
Set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Value "0"
Set-ItemProperty -path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Value "-"