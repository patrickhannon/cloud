$rgName = 'rg_eastus_77623_1_16654404961289'

New-AzResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile az104-04-vms-loop-template.json -TemplateParameterFile az104-04-vms-loop-parameters.json