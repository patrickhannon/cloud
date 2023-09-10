<#
labuser_77623_79715084@instructorwhizlabs.onmicrosoft.com
rg_eastus_77623_1_16669957171813
anvPFV!D?6#B8j$2
#>

Install-Module -Name Az.PrivateDns -force

#$backendSubnet = New-AzVirtualNetworkSubnetConfig -Name backendSubnet -AddressPrefix "10.2.0.0/24" $vnet = New-AzVirtualNetwork -ResourceGroupName MyAzureResourceGroup -Location eastus -Name myAzureVNet -AddressPrefix 10.2.0.0/16 -Subnet $backendSubnet

$zone = New-AzPrivateDnsZone -Name contoso.org -ResourceGroupName rg_eastus_77623_1_16667384401780

#$link = New-AzPrivateDnsVirtualNetworkLink -ZoneName private.contoso.com -ResourceGroupName MyAzureResourceGroup -Name "rg_eastus_77623_1_16667384401780" -VirtualNetworkId $vnet.id -EnableRegistration

nslookup az104-04-vm0.contoso.org
nslookup az104-04-vm1.contoso.org