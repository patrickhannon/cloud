#New-AzResourceGroup -Name azpjhaz104 -Location EastUS 
<#
labuser_77623_46871931@instructorwhizlabs.onmicrosoft.com
rg_eastus_77623_1_16665412171291
57$3TH!6k4#?iI%hX
username:phannon
password:_Phannon2
#>
Connect-AzAccount
New-AzVM -ResourceGroupName "rg_eastus_77623_1_16665412171291" -Name "newdnsvm" -Location "EastUS" -Size "Standard_B2s" -VirtualNetworkName "dnsvnet" -SubnetName "default"-SecurityGroupName "newpjhNSG" -PublicIpAddressName "az104pjhIPAddress" -OpenPorts 80,443,3389
New-AzVM -ResourceGroupName "rg_eastus_77623_1_16665412171291" -Name "az104vmpjh2" -Location "EastUS" -Size "Standard_B2s" -VirtualNetworkName "myVMVMNic2" -SubnetName "default"-SecurityGroupName "newpjhNSG2" -PublicIpAddressName "az104pjhIPAddress2" -OpenPorts 80,443,3389
New-AzVM -ResourceGroupName "rg_eastus_77623_1_16665412171291" -Name "newdnsvm2" -Location "EastUS" -Size "Standard_B2s" -VirtualNetworkName "dnsvnet" -SubnetName "default"-SecurityGroupName "newpjhNSG" -PublicIpAddressName "az104pjhIPAddress2" -OpenPorts 80,443,3389

Get-AzEffectiveNetworkSecurityGroup -NetworkInterfaceName myVMVMNic -ResourceGroupName "rg_eastus_77623_1_16663081281688"

<#
ResourceGroupName        : rg_eastus_77623_1_16637173591563
Id                       : /subscriptions/71fa0172-ce90-403c-94a9-14ce1e88f56a/resourceGroups/rg_eastus_77623_1_1663717
3591563/providers/Microsoft.Compute/virtualMachines/az104vmpjh
VmId                     : 9472c8db-b56d-4751-9ac4-9312450ac9e7
Name                     : az104vmpjh
Type                     : Microsoft.Compute/virtualMachines
Location                 : eastus
Tags                     : {}
HardwareProfile          : {VmSize}
NetworkProfile           : {NetworkInterfaces}
OSProfile                : {ComputerName, AdminUsername, WindowsConfiguration, Secrets, AllowExtensionOperations,
RequireGuestProvisionSignal}
ProvisioningState        : Succeeded
StorageProfile           : {ImageReference, OsDisk, DataDisks}
FullyQualifiedDomainName : az104vmpjh-4e39ea.EastUS.cloudapp.azure.com
#>
Stop-AzVM -ResourceGroupName "rg_eastus_77623_1_16637173591563" -Name "az104vmpjh"
<#
OperationId : a4c601aa-44fb-4a89-a872-c8841ed2cae0
Status      : Succeeded
StartTime   : 9/20/2022 7:17:13 PM
EndTime     : 9/20/2022 7:18:41 PM
Error       :
#>
Start-AzVM -ResourceGroupName "rg_eastus_77623_1_16637173591563" -Name "az104vmpjh"
<#
OperationId : 0b91a069-68e9-4775-a35a-1e7153b636b1
Status      : Succeeded
StartTime   : 9/20/2022 7:20:45 PM
EndTime     : 9/20/2022 7:21:06 PM
#>
#https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator/blob/master/Instructions/Labs/LAB_08-Manage_Virtual_Machines.md
New-AzVM -ResourceGroupName "rg_eastus_77623_1_16637173591563" -Name "az104-08-vm1" -Location "EastUS" -Size "Standard_B2s" -VirtualNetworkName "rg_eastus_77623_1_1663761094765-vnet/default" -SubnetName "default"-SecurityGroupName "newpjhNSG" -PublicIpAddressName "az104pjhIPAddress" -OpenPorts 80,443,3389

#labuser_77623_71048123@instructorwhizlabs.onmicrosoft.com Pay-As-You-Go    82676786-5bc7-43c6-b8f8-b3ee02b0b5f3 AzureC…

#Invoke-WebRequest -URI http://20.127.164.5 -UseBasicParsing

New-StoragePool -FriendlyName storagepool1 -StorageSubsystemFriendlyName "Windows Storage*" -PhysicalDisks (Get-PhysicalDisk -CanPool $true)

New-VirtualDisk -StoragePoolFriendlyName storagepool1 -FriendlyName virtualdisk1 -Size 2046GB -ResiliencySettingName Simple -ProvisioningType Fixed

Initialize-Disk -VirtualDisk (Get-VirtualDisk -FriendlyName virtualdisk1)

New-Partition -DiskNumber 4 -UseMaximumSize -DriveLetter Z

Register-AzResourceProvider -ProviderNamespace Microsoft.Insights

Register-AzResourceProvider -ProviderNamespace Microsoft.AlertsManagement

<#
rg_eastus_77623_1_16643196631341
#>
New-AzVM -ResourceGroupName "rg_eastus_77623_1_16643653201361" -Name "az104vmpjh" -Location "EastUS" -Size "Standard_B2s" -VirtualNetworkName "az104pjhvnet" -SubnetName "default"-SecurityGroupName "newpjhNSG" -PublicIpAddressName "az104pjhIPAddress" -OpenPorts 80,443,3389
<#
ResourceGroupName        : rg_eastus_77623_1_16643196631341
Id                       : /subscriptions/71fa0172-ce90-403c-94a9-14ce1e88f56a/resourceGroups/rg_eastus_77623_1_1664319
6631341/providers/Microsoft.Compute/virtualMachines/az104vmpjh
VmId                     : b369e4eb-3b5d-47d1-8669-da8b89af14e4
Name                     : az104vmpjh
Type                     : Microsoft.Compute/virtualMachines
Location                 : eastus
Tags                     : {}
HardwareProfile          : {VmSize}
NetworkProfile           : {NetworkInterfaces}
OSProfile                : {ComputerName, AdminUsername, WindowsConfiguration, Secrets, AllowExtensionOperations,
RequireGuestProvisionSignal}
ProvisioningState        : Succeeded
StorageProfile           : {ImageReference, OsDisk, DataDisks}
FullyQualifiedDomainName : az104vmpjh-6c040a.EastUS.cloudapp.azure.com
#>
#Redeploy a VM
Set-AzureRmVM -Redeploy -ResourceGroupName "rg_eastus_77623_1_16643653201361" -Name "az104vmpjh"

Set-AzureRmVM -ResourceGroupName "rg_eastus_77623_1_16643653201361" -Name "az104vmpjh" -Generalized
<#
Set-AzureRmVM: The 'Set-AzureRmVM' command was found in the module 'AzureRM.Compute', but the module could not be loaded. For more information, run 'Import-Module AzureRM.Compute'.
#>
