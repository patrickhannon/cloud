#ImplementIntersiteConnectivity
$location1 = 'eastus'
$location2 = 'westeurope'
#$rgName ='rg_eastus_77623_1_1665614823656'
$rgName ='rg_eastus_pjh'
<#
labuser_77623_67494110@instructorwhizlabs.onmicrosoft.com
0#g!cIJ3%MB69$n8*
rg_eastus_77623_1_1665701405878
rg_westeurope_77623_2_1665701406902
#>
Set-AzContext -Subscription "a07e1329-e13a-4c90-babc-03a38e8d3000"
#az login --tenant 5187a1a8-f9cd-46ed-8c75-11a891247bb0
New-AzResourceGroup -Name $rgName -Location $location1

New-AzResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile 05/az104-05-vnetvm-loop-template.json -TemplateParameterFile 05/az104-05-vnetvm-loop-parameters.json -location1 $location1 -location2 $location2

#Task 2: Configure local and global virtual network peering

$rgName = 'rg_eastus_pjh'

$vnet0 = Get-AzVirtualNetwork -Name 'az104-05-vnet0' -ResourceGroupName $rgname

$vnet1 = Get-AzVirtualNetwork -Name 'az104-05-vnet1' -ResourceGroupName $rgname

Add-AzVirtualNetworkPeering -Name 'az104-05-vnet0_to_az104-05-vnet1' -VirtualNetwork $vnet0 -RemoteVirtualNetworkId $vnet1.Id

Add-AzVirtualNetworkPeering -Name 'az104-05-vnet1_to_az104-05-vnet0' -VirtualNetwork $vnet1 -RemoteVirtualNetworkId $vnet0.Id

$rgName = 'rg_eastus_pjh'

#Add Peering 

$vnet0 = Get-AzVirtualNetwork -Name 'az104-05-vnet0' -ResourceGroupName $rgname

$vnet2 = Get-AzVirtualNetwork -Name 'az104-05-vnet2' -ResourceGroupName $rgname

Add-AzVirtualNetworkPeering -Name 'az104-05-vnet0_to_az104-05-vnet2' -VirtualNetwork $vnet0 -RemoteVirtualNetworkId $vnet2.Id

Add-AzVirtualNetworkPeering -Name 'az104-05-vnet2_to_az104-05-vnet0' -VirtualNetwork $vnet2 -RemoteVirtualNetworkId $vnet0.Id

$rgName = 'rg_eastus_pjh'

$vnet1 = Get-AzVirtualNetwork -Name 'az104-05-vnet1' -ResourceGroupName $rgname

$vnet2 = Get-AzVirtualNetwork -Name 'az104-05-vnet2' -ResourceGroupName $rgname

Add-AzVirtualNetworkPeering -Name 'az104-05-vnet1_to_az104-05-vnet2' -VirtualNetwork $vnet1 -RemoteVirtualNetworkId $vnet2.Id

Add-AzVirtualNetworkPeering -Name 'az104-05-vnet2_to_az104-05-vnet1' -VirtualNetwork $vnet2 -RemoteVirtualNetworkId $vnet1.Id

#Task 3: Test intersite connectivity
Test-NetConnection -ComputerName 10.51.0.4 -Port 3389 -InformationLevel 'Detailed'
<#
ComputerName            : 10.51.0.4
RemoteAddress           : 10.51.0.4
RemotePort              : 3389
NameResolutionResults   : 10.51.0.4
MatchingIPsecRules      :
NetworkIsolationContext : Internet
InterfaceAlias          : Ethernet
SourceAddress           : 10.50.0.4
NetRoute (NextHop)      : 10.50.0.1
TcpTestSucceeded        : True
#>
Test-NetConnection -ComputerName 10.52.0.4 -Port 3389 -InformationLevel 'Detailed'
<#
ComputerName            : 10.52.0.4
RemoteAddress           : 10.52.0.4
RemotePort              : 3389
NameResolutionResults   : 10.52.0.4
MatchingIPsecRules      :
NetworkIsolationContext : Internet
InterfaceAlias          : Ethernet
SourceAddress           : 10.50.0.4
NetRoute (NextHop)      : 10.50.0.1
TcpTestSucceeded        : True
#>
Test-NetConnection -ComputerName 10.52.0.4 -Port 3389 -InformationLevel 'Detailed'
<#
ComputerName            : 10.52.0.4
RemoteAddress           : 10.52.0.4
RemotePort              : 3389
NameResolutionResults   : 10.52.0.4
MatchingIPsecRules      :
NetworkIsolationContext : Internet
InterfaceAlias          : Ethernet
SourceAddress           : 10.51.0.4
NetRoute (NextHop)      : 10.51.0.1
PingSucceeded           : False
PingReplyDetails (RTT)  : 0 ms
TcpTestSucceeded        : False
#>

#Clean up resources
Get-AzResourceGroup -Name 'rg_eastus_p*'
#Delete resources
Get-AzResourceGroup -Name 'rg_eastus_p*' | Remove-AzResourceGroup -Force -AsJob