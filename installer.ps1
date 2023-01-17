
if (Get-Module -ListAvailable -Name Appx) {
    Write-Host "Appx exists"
    if (Get-Module -ListAvailable -Name Appx) {
        Import-Module Appx
    } 
} 
else {
    Write-Host "Appx does not exist, Installing ..."
    Install-Module Appx -force
    if (Get-Module -ListAvailable -Name Appx) {
        Import-Module Appx
    } 
}



# Import custom Regedit
Set-Location $PSScriptRoot
reg.exe import install.reg

$Bloatware = @(
                #Unnecessary Windows 10 AppX Apps
                "3DBuilder"
                "Microsoft3DViewer"
                "AppConnector"
                "BingFinance"
                "BingNews"
                "BingSports"
                "BingTranslator"
                "BingWeather"
                "BingFoodAndDrink"
                "BingHealthAndFitness"
                "BingTravel"
                "MinecraftUWP"
                # "WindowsReadingList"
                "GetHelp"
                "Getstarted"
                "Messaging"
                "Microsoft3DViewer"
                "MicrosoftSolitaireCollection"
                "NetworkSpeedTest"
                "News"
                "Lens"
                "Sway"
                "OneNote"
                "OneConnect"
                "People"
                "Print3D"
                "SkypeApp"
                "Todos"
                "Wallet"
                "Whiteboard"
                "WindowsAlarms"
                "windowscommunicationsapps"
                "WindowsFeedbackHub"
                "WindowsMaps"
                "WindowsPhone"
                "WindowsSoundRecorder"
                "ConnectivityStore"
                "CommsPhone"
                "ScreenSketch"
                "MixedReality.Portal"
                "ZuneMusic"
                "ZuneVideo"
                #"YourPhone"
                "Getstarted"
                "MicrosoftOfficeHub"

                #Sponsored Windows 10 AppX Apps
                #Add sponsored/featured apps to remove in the "*AppName*" format
                "EclipseManager"
                "ActiproSoftwareLLC"
                "AdobeSystemsIncorporated.AdobePhotoshopExpress"
                "Duolingo-LearnLanguagesforFree"
                "PandoraMediaInc"
                "CandyCrush"
                "BubbleWitch3Saga"
                "Wunderlist"
                "Flipboard"
                "Twitter"
                "Facebook"
                "Royal Revolt"
                "Sway"
                "Speed Test"
                "Dolby"
                "Viber"
                "ACGMediaPlayer"
                "Netflix"
                "OneCalendar"
                "LinkedInforWindows"
                "HiddenCityMysteryofShadows"
                "Hulu"
                "HiddenCity"
                "AdobePhotoshopExpress"
                "HotspotShieldFreeVPN"

                #Optional: Typically not removed but you can if you need to
                "Advertising"
                #"MSPaint"
                #"MicrosoftStickyNotes"
                #"Windows.Photos"
                #"WindowsCalculator"
                #"WindowsStore"

                # HPBloatware Packages
                "HPJumpStarts"
                "HPPCHardwareDiagnosticsWindows"
                "HPPowerManager"
                "HPPrivacySettings"
                "HPSupportAssistant"
                "HPSureShieldAI"
                "HPSystemInformation"
                "HPQuickDrop"
                "HPWorkWell"
                "myHP"
                "HPDesktopSupportUtilities"
                "HPQuickTouch"
                "HPEasyClean"
                "HPSystemInformation"
            )

            Write-Host "Removing Bloatware"

            foreach ($Bloat in $Bloatware) {
                Get-AppxPackage "*$Bloat*" | Remove-AppxPackage -ErrorAction SilentlyContinue
                Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*$Bloat*" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
                Write-Host "Trying to remove $Bloat."
            }

            Write-Host "Finished Removing Bloatware Apps"
            Write-Host "Removing Bloatware Programs"
            # Remove installed programs
            $InstalledPrograms = Get-Package | Where-Object { $UninstallPrograms -contains $_.Name }
            $InstalledPrograms | ForEach-Object {

                Write-Host -Object "Attempting to uninstall: [$($_.Name)]..."

                Try {
                    $Null = $_ | Uninstall-Package -AllVersions -Force -ErrorAction SilentlyContinue
                    Write-Host -Object "Successfully uninstalled: [$($_.Name)]"
                }
                Catch {
                    Write-Warning -Message "Failed to uninstall: [$($_.Name)]"
                }
            }
            Write-Host "Finished Removing Bloatware Programs"