# install
$CAC = Get-ChildItem (Get-Location)*.msi*

foreach ($msiPath in $CAC) {

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
        Write-Host "MSI:$msiPath Uninstalltion failed with exit code $($process.ExitCode)."
    }
}
Write-Host "Uninstalltion END."