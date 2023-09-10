<#
labuser_77623_79715084@instructorwhizlabs.onmicrosoft.com
rg_eastus_77623_1_16669957171813
anvPFV!D?6#B8j$2
#>
$rule1 = New-AzNetworkSecurityRuleConfig -Name rdp-rule -Description "AllowRDPInBound" -Access Allow -Protocol Tcp -Direction Inbound -Priority 300 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389

$rule2 = New-AzNetworkSecurityRuleConfig -Name web-rule -Description "Allow HTTP" -Access Allow -Protocol Tcp -Direction Inbound -Priority 101 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 80

$nsg = New-AzNetworkSecurityGroup -ResourceGroupName rg_eastus_77623_1_16667384401780 -Location eastus -Name "az104-04-nsg01" -SecurityRules $rule1 #,$rule2