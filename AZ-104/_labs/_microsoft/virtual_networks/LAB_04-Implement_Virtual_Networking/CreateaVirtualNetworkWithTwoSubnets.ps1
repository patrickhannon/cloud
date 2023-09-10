<#
labuser_77623_79715084@instructorwhizlabs.onmicrosoft.com
rg_eastus_77623_1_16669957171813
anvPFV!D?6#B8j$2
#>

#Create the virtual network
$vnet = @{
    Name = 'az104-04-vnet1'
    ResourceGroupName = 'rg_eastus_77623_1_16667384401780'
    Location = 'EastUS'
    AddressPrefix = '10.40.0.0/20'    
}
$virtualNetwork = New-AzVirtualNetwork @vnet


#Add a subnet
$subnet = @{
    Name = 'subnet0'
    VirtualNetwork = $virtualNetwork
    AddressPrefix = '10.40.0.0/24'
}

$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet


#Add a subnet
$subnet2 = @{
    Name = 'subnet1'
    VirtualNetwork = $virtualNetwork
    AddressPrefix = '10.40.1.0/24'
}

$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet2
#Associate the subnet to the virtual network

$virtualNetwork | Set-AzVirtualNetwork
