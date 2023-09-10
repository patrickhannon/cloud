<#
labuser_77623_23357960@instructorwhizlabs.onmicrosoft.com
u%D0$x#rFc18g72QG
rg_eastus_77623_1_16673421311203
#>
$location = 'eastus'
$rgName = 'az104-06-rg1'
#$rgName = 'rg_eastus_77623_1_16673421311203'
New-AzResourceGroup -Name $rgName -Location $location
<#
ResourceGroupName : az104-06-rg1
Location          : eastus
ProvisioningState : Succeeded
Tags              :
ResourceId        : /subscriptions/efc4dc30-77e6-40ef-8fa7-723d050178ff/resourceGroups/az104-06-rg1
#>

New-AzResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile az104-06-vms-loop-template.json -TemplateParameterFile az104-06-vms-loop-parameters.json
<#
DeploymentName          : az104-06-vms-loop-template
ResourceGroupName       : rg_eastus_77623_1_16669957171813
ProvisioningState       : Succeeded
Timestamp               : 10/28/2022 11:28:36 PM
Mode                    : Incremental
TemplateLink            :
Parameters              :
                          Name             Type                       Value
                          ===============  =========================  ==========
                          vmSize           String                     "Standard_B2s"
                          vmName           String                     "az104-06-vm"
                          vmCount          Int                        4
                          adminUsername    String                     "Student"
                          adminPassword    SecureString               null

Outputs                 :
DeploymentDebugLogLevel :
#>
az vm list-skus --location eastus -o table --query "[? contains(name,'Standard_B2s')].name"
<#
Result
------------
Standard_B2s
#>