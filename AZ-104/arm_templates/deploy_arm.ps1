$templateFile="azuredeploy.json" 
$today=$(date +"%d-%b-%Y") 
$DeploymentName="blanktemplate-"+$today 
az deployment group create --name $DeploymentName --template-file $templateFile