echo "Start Copy Profiles"
del "C:\ProgramData\Cisco\Cisco Secure Client\VPN\Profile\*.xml"
echo del "C:\ProgramData\Cisco\Cisco Secure Client\Umbrella\OrgInfo.json"
copy "%~dp0\Profiles\vpn\CognyteAnyConnectProfile.xml" "C:\ProgramData\Cisco\Cisco Secure Client\VPN\Profile"
copy "%~dp0\Profiles\umbrella\OrgInfo.json" "C:\ProgramData\Cisco\Cisco Secure Client\Umbrella"
copy "%~dp0\Profiles\System\*" "C:\ProgramData\Cisco\Cisco Secure Client\Network Access Manager\system"
pause
PowerShell.exe -ExecutionPolicy Bypass -File "%~dp0install.ps1"
echo "End Installation"
pause