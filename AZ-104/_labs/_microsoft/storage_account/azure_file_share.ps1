<#
    
#>
Connect-AzAccount

$connectTestResult = Test-NetConnection -ComputerName az204cdntest.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"az204cdntest.file.core.windows.net`" /user:`"localhost\az204cdntest`" /pass:`"Vfu+ycwZ37uC9XLNlujDPVTeJcNbiWDxouK8DvvbIfCrXE7OBEbDHjA7rHUyBiCgb29C8Hh9xxaE+AStPBgToA==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\az204cdntest.file.core.windows.net\az104testfileshare" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}