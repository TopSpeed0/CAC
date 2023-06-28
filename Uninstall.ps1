# install C:\Users\ybohadana\OneDrive - COGNYTE\Desktop\Cisco AnyConnect 5.0.3
$CAC = Get-ChildItem (Get-Location)*.msi*
$u_CAC = $CAC | Sort-Object -Descending
# Uninstalltion
foreach ($msiPath in $u_CAC) {
    # Start the Uninstalltion process
    if ($msiPath -match '-nam-predeploy-k9') {
        $process = Start-Process -FilePath "msiexec.exe" -ArgumentList "/x `"$msiPath`" REBOOT=ReallySuppress /qn /norestart" -PassThru -Wait
    } else {
        $process = Start-Process -FilePath "msiexec.exe" -ArgumentList "/x `"$msiPath`" /qn /norestart" -PassThru -Wait
    }
    # Check the exit code of the Uninstalltion process
    if ($process.ExitCode -eq 0) {
        Write-Host "MSI:$msiPath Uninstalltion completed successfully."
    }
    else {
        Write-Host "MSI:$msiPath Uninstalltion failed with exit code $($process.ExitCode)." -ForegroundColor Red
        pause
    }
}
# Remove-Item 'C:\ProgramData\Cisco\Cisco Secure Client\Umbrella' -Force -Confirm:$true -ErrorAction SilentlyContinue
Write-Host "Uninstalltion END."
# end of Uninstalltion
