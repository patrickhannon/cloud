RESOURCE_GROUP='rg_eastus_77623_1_168726189043'

AKS_CLUSTER='az104-9c-aks1'

az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER