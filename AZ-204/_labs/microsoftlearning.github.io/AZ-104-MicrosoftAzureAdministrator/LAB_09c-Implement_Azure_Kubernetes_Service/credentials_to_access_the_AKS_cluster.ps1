#credentials_to_access_the_AKS_cluster
$RESOURCE_GROUP='az104-09c-rg1'

$AKS_CLUSTER='az104-9c-aks1'

az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER