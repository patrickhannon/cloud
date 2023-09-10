<#
labuser_77623_61726487@instructorwhizlabs.onmicrosoft.com
FU7Q!r5%zJ*8gtu1B
rg_eastus_77623_1_1666871131697
#>
$rgName = 'rg_eastus_77623_1_1666871131697'
$location = (Get-AzResourceGroup -ResourceGroupName $rgName).location
$vmNames = (Get-AzVM -ResourceGroupName $rgName).Name
#run the following to install the Network Watcher extension on the Azure VMs deployed in the previous step:
foreach ($vmName in $vmNames) {
Set-AzVMExtension -ResourceGroupName $rgName -Location $location -VMName $vmName -Name 'networkWatcherAgent' -Publisher 'Microsoft.Azure.NetworkWatcher' -Type 'NetworkWatcherAgentWindows' -TypeHandlerVersion '1.4'
}
<#
RequestId IsSuccessStatusCode StatusCode ReasonPhrase
--------- ------------------- ---------- ------------
                         True         OK OK
                         True         OK OK
                         True         OK OK
                         True         OK OK
#>