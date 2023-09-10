<#
    labuser_77623_80375568@instructorwhizlabs.onmicrosoft.com
    rg_eastus_77623_1_1663106703187
    rg_southeastasia_77623_3_16631067071010
    dQrsLD&P42h*6#%
    rg_westeurope_77623_2_16631067041639
#>
#Connect-AzAccount
<#
$location = 'eastus'
$rgName = 'az104-07-rg0'
New-AzResourceGroup -Name $rgName -Location $location
#>
$location = 'eastus'
#$rgName = 'rg_eastus_77623_1_1663106703187'
$rgName = 'az104-07-rg0'
New-AzResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile az104-07-vm-template.json -TemplateParameterFile az104-07-vm-parameters.json -AsJob

<#
Id     Name            PSJobTypeName   State         HasMoreData     Location             Command
--     ----            -------------   -----         -----------     --------             -------
1      Long Running O… AzureLongRunni… Running       True            localhost            New-AzResourceGroupDeplo…
#>


az group show -n 'az104-07-rg0' --query $location


$connectTestResult = Test-NetConnection -ComputerName az104testpjh.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"az104testpjh.file.core.windows.net`" /user:`"localhost\az104testpjh`" /pass:`"Sh7ibYhLG1cdylbeZajJIaRyxPTYYbCXvzlOqMQYnc3t4Op2DjGv5sovE8uKftgjgUGQm8lQwud/+AStbclZvw==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\az104testpjh.file.core.windows.net\az104-07-share" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}
<#
PS C:\Users\Student> $connectTestResult = Test-NetConnection -ComputerName az104testpjh.file.core.windows.net -Port 445
PS C:\Users\Student> if ($connectTestResult.TcpTestSucceeded) {
>>     # Save the password so the drive will persist on reboot
>>     cmd.exe /C "cmdkey /add:`"az104testpjh.file.core.windows.net`" /user:`"localhost\az104testpjh`" /pass:`"Sh7ibYhLG1cdylbeZajJIaRyxPTYYbCXvzlOqMQYnc3t4Op2DjGv5sovE8uKftgjgUGQm8lQwud/+AStbclZvw==`""
>>     # Mount the drive
>>     New-PSDrive -Name Z -PSProvider FileSystem -Root "\\az104testpjh.file.core.windows.net\az104-07-share" -Persist
>> } else {
>>     Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
>> }

CMDKEY: Credential added successfully.

Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
Z                   0.00       5120.00 FileSystem    \\az104testpjh.file.core.windows...
#>
New-Item -Type Directory -Path 'Z:\az104-07-folder'

New-Item -Type File -Path 'Z:\az104-07-folder\az-104-07-file.txt'

Invoke-WebRequest -URI 'https://az104testpjh.blob.core.windows.net/az104-07-container/licenses/LICENSE?sp=r&st=2022-09-13T23:51:28Z&se=2022-09-14T07:51:28Z&spr=https&sv=2021-06-08&sr=b&sig=9LKxxeNq%2FOYOLOh1OyfHvlUlKmrGRDjln40d3NyVcqE%3D'