<#
labuser_77623_79715084@instructorwhizlabs.onmicrosoft.com
rg_eastus_77623_1_16669957171813
anvPFV!D?6#B8j$2
#>
$rgName = 'rg_eastus_77623_1_16669957171813'
$location = (Get-AzResourceGroup -ResourceGroupName $rgName).location
$vmNames = (Get-AzVM -ResourceGroupName $rgName).Name
foreach ($vmName in $vmNames) { 
    Set-AzVMExtension -ResourceGroupName $rgName -Location $location -VMName $vmName -Name 'networkWatcherAgent' -Publisher 'Microsoft.Azure.NetworkWatcher' -Type 'NetworkWatcherAgentWindows' -TypeHandlerVersion '1.4'
}
<#
Requ