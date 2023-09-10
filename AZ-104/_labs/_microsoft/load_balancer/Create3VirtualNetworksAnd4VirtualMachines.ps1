<#
labuser_77623_61726487@instructorwhizlabs.onmicrosoft.com
FU7Q!r5%zJ*8gtu1B
rg_eastus_77623_1_1666871131697
#>
$rgName = 'rg_eastus_77623_1_1666871131697'
New-AzResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile az104-06-vms-loop-template.json -TemplateParameterFile az104-06-vms-loop-parameters.json
#Check the location where resource group is deployed
az group show -n rg_eastus_77623_1_1666826902759 --query location
"eastus"
#List Sku's of the VMs 
az vm list-skus --location eastus -o table --query "[? contains(name,'Standard_B2s')].name"
#Result
#------------
#Standard_B2s