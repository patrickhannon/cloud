<#
labuser_77623_54491654@instructorwhizlabs.onmicrosoft.com
rg_eastus_77623_1_16666113581731
Xs%Q14B&wG2?Sb
#>

#Create the virtual network
$vnet = @{
    Name = 'az104-04-vnet1'
    ResourceGroupName = 'rg_eastus_77623_1_16666113581731'
    Location = 'EastUS'
    AddressPrefix = '10.40.0.0/20'    
}
$virtualNetwork = New-AzVirtualNetwork @vnet
