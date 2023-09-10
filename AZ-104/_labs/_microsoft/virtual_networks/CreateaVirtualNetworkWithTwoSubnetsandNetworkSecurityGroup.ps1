#New-AzResourceGroup -Name TestResourceGroup -Location eastus

#$rdpRule = New-AzNetworkSecurityRuleConfig -Name rdp-rule -Description "Allow RDP" -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix Internet -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389 
    
#$networkSecurityGroup = New-AzNetworkSecurityGroup -ResourceGroupName rg_eastus_77623_1_16654404961289 -Location centralus -Name "NSG-FrontEnd" -SecurityRules $rdpRule

$frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name subnet0 -AddressPrefix "10.40.0.0/24" #-NetworkSecurityGroup $networkSecurityGroup

$backendSubnet = New-AzVirtualNetworkSubnetConfig -Name subnet1 -AddressPrefix "10.40.1.0/24" #-NetworkSecurityGroup $networkSecurityGroup

#$pip = New-AzPublicIpAddress -Name "pip" -ResourceGroupName "natgateway_test" -Location "eastus" -Sku "Standard" -IdleTimeoutInMinutes 4 -AllocationMethod "static"

#$natgateway = New-AzNatGateway -ResourceGroupName "natgateway_test" -Name "nat_gateway" -IdleTimeoutInMinutes 4 -Sku "Standard" -Location "eastus" -PublicIpAddress $pip

#$natGatewaySubnet = New-AzVirtualNetworkSubnetConfig -Name natGatewaySubnet -AddressPrefix "10.0.3.0/24" -InputObject $natGateway

New-AzVirtualNetwork -Name az104-04-vnet1 -ResourceGroupName rg_eastus_77623_1_16654404961289 -Location eastus -AddressPrefix "10.40.0.0/20" -Subnet $frontendSubnet,$backendSubnet #,$natGatewaySubnet