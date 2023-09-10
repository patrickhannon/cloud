<#
labuser_77623_79715084@instructorwhizlabs.onmicrosoft.com
rg_eastus_77623_1_16669957171813
anvPFV!D?6#B8j$2
#>
New-AzDnsZone -Name theplasticpaddy.com -ResourceGroupName rg_eastus_77623_1_16667384401780
<#
Name                          : theplasticpaddy.com
ResourceGroupName             : rg_eastus_77623_1_16667384401780
Etag                          : 00000002-0000-0000-b152-cb4ecfe8d801
Tags                          : {}
NameServers                   : {ns1-05.azure-dns.com., ns2-05.azure-dns.net., ns3-05.azure-dns.org.,
                                ns4-05.azure-dns.info.}
ZoneType                      : Public
RegistrationVirtualNetworkIds : {}
ResolutionVirtualNetworkIds   : {}
NumberOfRecordSets            : 2
MaxNumberOfRecordSets         : 10000
#>

nslookup az104-04-vm0.theplasticpaddy.com [Name server 1]