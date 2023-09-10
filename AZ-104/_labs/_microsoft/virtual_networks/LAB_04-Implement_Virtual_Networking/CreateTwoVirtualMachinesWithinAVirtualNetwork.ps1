<#
labuser_77623_79715084@instructorwhizlabs.onmicrosoft.com
rg_eastus_77623_1_16669957171813
anvPFV!D?6#B8j$2
#>
$rgName = 'rg_eastus_77623_1_16669957171813'
New-AzResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile az104-04-vms-loop-template.json -TemplateParameterFile az104-04-vms-loop-parameters.json
<#
PS C:\Users\patri\OneDrive\___Docs\__Cloud\___azure\AZ-104 Prerequisites for Azure administrators\virtual_networks\LAB_04-Implement_Virtual_Networking> .\CreateTwoVirtualMachinesWithinAVirtualNetwork.ps1

DeploymentName          : az104-04-vms-loop-template
ResourceGroupName       : rg_eastus_77623_1_16667384401780
ProvisioningState       : Succeeded
Timestamp               : 10/25/2022 11:04:25 PM
Mode                    : Incremental
TemplateLink            :
Parameters              :
                          Name                  Type                       Value
                          ====================  =========================  ==========
                          vmSize                String                     "Standard_B2s"
                          vmName                String                     "az104-04-vm"
                          vmCount               Int                        2
                          adminUsername         String                     "Student"
                          adminPassword         SecureString               null
                          virtualNetworkName    String                     "az104-04-vnet1"

Outputs                 :
DeploymentDebugLogLevel :
#>
az vm list-skus --location eastus -o table --query "[? contains(name,'Standard_B2s')].name"
<#
Result
------------
Standard_B2s
#>