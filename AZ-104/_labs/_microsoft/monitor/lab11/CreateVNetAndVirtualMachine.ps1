$location = 'eastus'

$rgName = 'az104-11-rg0'

#az account set --subscription "a07e1329-e13a-4c90-babc-03a38e8d3000"

Connect-AzAccount -Tenant '5187a1a8-f9cd-46ed-8c75-11a891247bb0' -SubscriptionId 'a07e1329-e13a-4c90-babc-03a38e8d3000'

New-AzResourceGroup -Name $rgName -Location $location

New-AzResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile az104-11-vm-template.json -TemplateParameterFile az104-11-vm-parameters.json -AsJob

Register-AzResourceProvider -ProviderNamespace Microsoft.Insights

Register-AzResourceProvider -ProviderNamespace Microsoft.AlertsManagement

#From the Command Prompt, run the following to trigger increased CPU utilization on the az104-11-vm0 Azure VM:
for /l %a in (0,0,1) do echo a

Get-AzResourceGroup -Name 'az104-11*'

Get-AzResourceGroup -Name 'az104-11*' | Remove-AzResourceGroup -Force -AsJob