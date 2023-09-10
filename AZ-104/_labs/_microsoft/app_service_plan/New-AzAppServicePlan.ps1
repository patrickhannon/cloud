#New-AzAppServicePlan
<#
labuser_77623_57205320@instructorwhizlabs.onmicrosoft.com
rg_eastus_77623_1_16646622771814
5t#o8Bx3*Ye0V?KF
az104webapppjh
az104storeaccpjh
az104scontainerpjh
az104appserplanpjh
#>
$myResourceGroup ="rg_eastus_77623_1_16646622771814"
$webappname ="az104webapppjh"
$location ="East US"
New-AzAppServicePlan -ResourceGroupName $myResourceGroup -Name "az104Appserviceplanpjh" -Location $location -Tier "Standard" -NumberofWorkers 2 -WorkerSize "Small"
<#
AdminSiteName             :
WorkerTierName            :
Status                    : Ready
Subscription              : 71fa0172-ce90-403c-94a9-14ce1e88f56a
HostingEnvironmentProfile :
MaximumNumberOfWorkers    : 0
GeoRegion                 : East US
PerSiteScaling            : False
ElasticScaleEnabled       :
MaximumElasticWorkerCount :
NumberOfSites             : 0
IsSpot                    : False
SpotExpirationTime        :
FreeOfferExpirationTime   :
ResourceGroup             : rg_eastus_77623_1_16646622771814
Reserved                  : False
IsXenon                   : False
HyperV                    :
TargetWorkerCount         : 0
TargetWorkerSizeId        : 0
ProvisioningState         : Succeeded
KubeEnvironmentProfile    :
Sku                       : Microsoft.Azure.Management.WebSites.Models.SkuDescription
ExtendedLocation          :
Id                        : /subscriptions/71fa0172-ce90-403c-94a9-14ce1e88f56a/resourceGroups/rg_eastus_77623_1_166457
                            6851213/providers/Microsoft.Web/serverfarms/az104Appserviceplanpjh
Name                      : az104Appserviceplanpjh
Kind                      : app
Location                  : East US
Type                      : Microsoft.Web/serverfarms
Tags                      :
#>
# Create a web app.
New-AzWebApp -Name $webappname -Location $location -AppServicePlan $webappname -ResourceGroupName $myResourceGroup
<#
AzureStoragePath            :
GitRemoteName               :
GitRemoteUri                :
GitRemoteUsername           :
GitRemotePassword           :
AzureStorageAccounts        :
State                       : Running
HostNames                   : {az104webapppjh.azurewebsites.net}
RepositorySiteName          : az104webapppjh
UsageState                  : Normal
Enabled                     : True
EnabledHostNames            : {az104webapppjh.azurewebsites.net, az104webapppjh.scm.azurewebsites.net}
AvailabilityState           : Normal
HostNameSslStates           : {az104webapppjh.azurewebsites.net, az104webapppjh.scm.azurewebsites.net}
ServerFarmId                : /subscriptions/71fa0172-ce90-403c-94a9-14ce1e88f56a/resourceGroups/rg_eastus_77623_1_1664
                              576851213/providers/Microsoft.Web/serverfarms/az104webapppjh
Reserved                    : False
IsXenon                     : False
HyperV                      :
LastModifiedTimeUtc         : 9/30/2022 10:44:52 PM
SiteConfig                  : Microsoft.Azure.Management.WebSites.Models.SiteConfig
TrafficManagerHostNames     :
ScmSiteAlsoStopped          : False
TargetSwapSlot              :
HostingEnvironmentProfile   :
ClientAffinityEnabled       : True
ClientCertEnabled           : False
ClientCertMode              :
ClientCertExclusionPaths    :
HostNamesDisabled           : False
CustomDomainVerificationId  : 159A1279EC54A97F92E7FCA5B72870F3858823E81280CE15A70826903A176EB5
OutboundIpAddresses         : 40.88.255.249,20.75.136.25,20.75.136.67,20.75.136.143,40.88.255.243,40.88.254.25,20.49.10
                              4.30
PossibleOutboundIpAddresses : 40.88.255.249,20.75.136.25,20.75.136.67,20.75.136.143,40.88.255.243,40.88.254.25,40.88.25
                              5.186,20.75.136.254,40.76.131.44,40.88.218.164,40.88.255.250,40.88.218.210,40.88.218.211,
                              40.88.219.173,40.88.220.62,40.88.221.185,40.88.250.94,40.88.250.95,40.88.251.132,40.88.25
                              1.133,40.88.252.149,40.88.253.46,40.88.253.140,40.88.219.172,40.88.253.141,40.88.253.148,
                              40.88.253.149,40.88.253.171,40.88.254.65,40.88.254.70,20.49.104.30
ContainerSize               : 0
DailyMemoryTimeQuota        : 0
SuspendedTill               :
MaxNumberOfWorkers          :
CloningInfo                 :
ResourceGroup               : rg_eastus_77623_1_1664576851213
IsDefaultContainer          :
DefaultHostName             : az104webapppjh.azurewebsites.net
SlotSwapStatus              :
HttpsOnly                   : False
RedundancyMode              :
InProgressOperationId       :
StorageAccountRequired      :
KeyVaultReferenceIdentity   :
VirtualNetworkSubnetId      :
Identity                    :
ExtendedLocation            :
Id                          : /subscriptions/71fa0172-ce90-403c-94a9-14ce1e88f56a/resourceGroups/rg_eastus_77623_1_1664
                              576851213/providers/Microsoft.Web/sites/az104webapppjh
Name                        : az104webapppjh
Kind                        : app
Location                    : East US
Type                        : Microsoft.Web/sites
Tags                        :
#>
$webapp = Get-AzWebApp -ResourceGroupName "rg_eastus_77623_1_16646622771814"
while ($true) { Invoke-WebRequest -Uri $webapp.DefaultHostName }
