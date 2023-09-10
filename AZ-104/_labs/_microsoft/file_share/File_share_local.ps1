$connectTestResult = Test-NetConnection -ComputerName sc123456pjh.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"sc123456pjh.file.core.windows.net`" /user:`"localhost\sc123456pjh`" /pass:`"LoEhVEQrMP5vL/8H8oxUJwoZAliFqW3JOyRiGxi23eBkn2PgDvvwPaFV94MEXM08IlhLN6bhFX4h+ASttVu2KA==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\sc123456pjh.file.core.windows.net\sc123456pjhgg" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}