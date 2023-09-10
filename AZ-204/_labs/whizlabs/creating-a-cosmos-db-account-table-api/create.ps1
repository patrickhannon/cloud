# Variable for resource group name
$RESOURCE_GROUP_NAME = "rg_westus_77623_1_168529066081"
$LOCATION = "eastus"

# Variable for account name with a randomnly generated suffix msdocs-1487748754
$SUFFIX = Get-Random
$ACCOUNT_NAME = "msdocs-$SUFFIX"

$parameters = @{
    ResourceGroupName = $RESOURCE_GROUP_NAME
    Name = $ACCOUNT_NAME
    Location = $LOCATION
    ApiKind = "Table"
}
New-AzCosmosDBAccount @parameters

#Get API for Table connection string
#$env:COSMOS_CONNECTION_STRING = "<cosmos-connection-string>"
$env:COSMOS_CONNECTION_STRING = "DefaultEndpointsProtocol=https;AccountName=msdocs-1487748754;AccountKey=4G7plKTWrtEcKHjfBqaH0hXPfF8nLM0PUbSVR81LjfDDautMLlfCYFhr4HgM1KpClULrHuLGk2pdACDbuOzsDA==;TableEndpoint=https://msdocs-1487748754.table.cosmos.azure.com:443/;"
$parameters = @{
    ResourceGroupName = "rg_westus_77623_1_168529066081"
    Name = "msdocs-1487748754"
    Type = "ConnectionStrings"
}    
Get-AzCosmosDBAccountKey @parameters | Select-Object -Property "Primary Table Connection String"