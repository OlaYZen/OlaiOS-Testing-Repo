
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



# Import custom Regedit and Start wallpaper script
Set-Location $PSScriptRoot
reg.exe import install.reg
Start-Sleep -s 3
Start-Process customwallpaper.ps1