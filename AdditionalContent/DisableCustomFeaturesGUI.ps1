# function ClockSecs(){
# if ($checkBox.Checked)
#     {
#         Set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSecondsInSystemClock" -Value 1
#         Stop-Process -n explorer
#         c:\windows\explorer.exe
#     }
# else
#         {
#             Set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSecondsInSystemClock" -Value 0
#             Stop-Process -n explorer
#             c:\windows\explorer.exe
#         }
# }

# $checkBox.Add_Checked({ClockSecs})
# $checkBox.Add_UnChecked({ClockSecs}) 

#========================================================
#    Writes out OlaYZen's Name
#========================================================

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



Start-Sleep -Milliseconds 500

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("PresentationFramework")

function CheckBoxFunc {
    if ($checkBox.Checked)
        {
            Set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSecondsInSystemClock" -Value 1
            Stop-Process -n explorer
            c:\windows\explorer.exe
        }
    else
        {
            Set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSecondsInSystemClock" -Value 0
            Stop-Process -n explorer
            c:\windows\explorer.exe 
        }
}


$checkBox = new-object System.Windows.Forms.checkbox
$checkBox.Location = '5, 5'
$checkBox.Size = '185, 15'
$checkBox.Text = "Show Seconds in Taskbar"
$checkBox.Add_Click({CheckBoxFunc})

$value1 = Get-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSecondsInSystemClock"
if($value1.ShowSecondsInSystemClock -eq 1)
{
    $checkBox.Checked = $true
}

$Form = New-Object System.Windows.Forms.Form
$Form.StartPosition = "CenterScreen"
$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$Form.Name = "mainForm"
$Form.Text = "Enable and Disable Custom Features"
$Form.MaximizeBox = $False
$Form.ShowInTaskbar = $true
$Form.Controls.Add($checkBox)

$Form.Add_Shown({$Form.Activate()})
$Form.Size = '452, 142'
$Form.Topmost = $false 

[void]$Form.ShowDialog()
[void]$Form.Dispose()
