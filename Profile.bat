echo del "C:\ProgramData\Cisco\Cisco Secure Client\VPN\Profile\*.xml"
echo del "C:\ProgramData\Cisco\Cisco Secure Client\Umbrella\OrgInfo.json"
echo copy "%~dp0\Profiles\vpn\CognyteAnyConnectProfile.xml" "C:\ProgramData\Cisco\Cisco Secure Client\VPN\Profile"
echo copy "%~dp0\Profiles\umbrella\OrgInfo.json" "C:\ProgramData\Cisco\Cisco Secure Client\Umbrella"