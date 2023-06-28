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

# installation
foreach ($msiPath in $CAC) {
    # Start
    Write-Host "Start MSI installation of:$msiPath." -ForegroundColor Yellow
    # Start the installation process
    if ($msiPath -match '-nam-predeploy-k9') {
        $process = Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$msiPath`" REBOOT=ReallySuppress /qn /norestart" -PassThru -Wait
    } elseif ($msiPath -notmatch 'iseposture-predeploy-k9') {
        $process = Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$msiPath`" /qn /norestart" -PassThru -Wait
    } else {
    }
    # Check the exit code of the installation process
    if ($process.ExitCode -eq 0) {
        Write-Host "MSI:$msiPath installation completed successfully." -ForegroundColor Gray
    }
    else {
        Write-Host "MSI:$msiPath installation failed with exit code $($process.ExitCode)." -ForegroundColor Red
        pause
    }
}
# end of installation
Write-Host "installation END."
Start-Process -FilePath "C:\Program Files (x86)\Cisco\Cisco Secure Client\UI\csc_ui.exe"