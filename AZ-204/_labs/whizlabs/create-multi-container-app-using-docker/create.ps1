#git clone https://github.com/Azure-Samples/multicontainerwordpress

#cd multicontainerwordpress

#az appservice plan create --name myAppServicePlan --resource-group rg_eastus_77623_1_168581547871 --sku S1 --is-linux

az webapp create --resource-group rg_eastus_77623_1_168581547871 --plan myAppServicePlan --name appNamePjh --multicontainer-config-type compose --multicontainer-config-file compose-wordpress.yml