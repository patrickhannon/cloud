<#
labuser_77623_23357960@instructorwhizlabs.onmicrosoft.com
u%D0$x#rFc18g72QG
rg_eastus_77623_1_16673421311203
#>
$location = 'eastus'
$rgName = 'rg_eastus_pjh_az104'

Connect-AzAccount

az account set --subscription "a07e1329-e13a-4c90-babc-03a38e8d3000"

New-AzResourceGroup -Name $rgName -Location $location
#New-AzResourceGroup -Name $rgName -Location $location
New-AzResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile az104-11-vm-template.json -TemplateParameterFile az104-11-vm-parameters.json -AsJob

#Register-AzResourceProvider -ProviderNamespace Microsoft.Insights
#Register-AzResourceProvider -ProviderNamespace Microsoft.AlertsManagement