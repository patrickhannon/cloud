<#
labuser_77623_23357960@instructorwhizlabs.onmicrosoft.com
u%D0$x#rFc18g72QG
rg_eastus_77623_1_16673421311203
#>
$rgName = 'az104-06-rg1'
$location = (Get-AzResourceGroup -ResourceGroupName $rgName).location
$vmNames = (Get-AzVM -ResourceGroupName $rgName).Name

foreach ($vmName in $vmNames) {
    Set-AzVMExtension -ResourceGroupName $rgName -Location $location -VMName $vmName -Name 'networkWatcherAgent' -Publisher 'Microsoft.Azure.NetworkWatcher' -Type 'NetworkWatcherAgentWindows' -TypeHandlerVersion '1.4'
}
<#
RequestId IsSuccessStatusCode StatusCode ReasonPhrase
--------- ------------------- ---------- ------------
                         True         OK OK
                         True         OK OK
#>
#install the Remote Access Windows Server role
Install-WindowsFeature RemoteAccess -IncludeManagementTools
<#
Success Restart Needed Exit Code      Feature Result                               
------- -------------- ---------      --------------                               
True    No             Success        {Remote Access}                              
#>

#install the Routing role service

Install-WindowsFeature -Name Routing -IncludeManagementTools -IncludeAllSubFeature

Install-WindowsFeature -Name "RSAT-RemoteAccess-Powershell"

Install-RemoteAccess -VpnType RoutingOnly

Get-NetAdapter | Set-NetIPInterface -Forwarding Enabled

<#
Success Restart Needed Exit Code      Feature Result                               
------- -------------- ---------      --------------                               
True    No             Success        {RAS Connection Manager Administration Kit...
True    No             NoChangeNeeded {}                                           
#>
Get-AzResourceGroup -Name 'az104-06*'
<#
ResourceGroupName : az104-06-rg1
Location          : eastus
ProvisioningState : Succeeded
Tags              :
ResourceId        : /subscriptions/efc4dc30-77e6-40ef-8fa7-723d050178ff/resourceGroups/az104-06-rg1
#>
Get-AzResourceGroup -Name 'az104-06*' | Remove-AzResourceGroup -Force -AsJob