#Lab 10 - Backup virtual machines
<#
$location = '[Azure_region]'
$rgName = 'az104-10-rg0'
New-AzResourceGroup -Name $rgName -Location $location
#>
$rgName = 'rg_eastus_77623_1_1664406212798'
New-AzResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile az104-10-vms-edge-template.json -TemplateParameterFile az104-10-vms-edge-parameters.json -AsJob
