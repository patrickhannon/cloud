#https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-powershell
New-AzResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName ExampleResourceGroup `
  -TemplateFile <path-to-template> `
  -TemplateParameterFile c:\MyTemplates\storage.parameters.json

az vm image list --output table 
<#
x64             
RHEL                          
RedHat                  
7-LVM                               
RedHat:RHEL:7-LVM:latest  
#>