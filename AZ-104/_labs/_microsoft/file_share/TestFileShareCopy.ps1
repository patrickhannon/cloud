$connectTestResult = Test-NetConnection -ComputerName filesharecopytest.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"filesharecopytest.file.core.windows.net`" /user:`"localhost\filesharecopytest`" /pass:`"GWnjqI1B5y4d2ypZ7RFHBAOMEkeCIQyPwLMJtucnqYLXSrVjvwHj7TOmErYy87JupKOPANqDI3a0+ASt7+y1GQ==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\filesharecopytest.file.core.windows.net\test" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}