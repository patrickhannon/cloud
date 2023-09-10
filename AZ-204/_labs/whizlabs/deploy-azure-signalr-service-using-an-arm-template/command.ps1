labuser_77623_50117441 [ ~ ]$ az deployment group create --name mywhizlabdeployment3 --resource-group rg_eastus_77623_1_1677198009499 --template-file template.json --parameters name=whizlabsignalr1 location=eastus pricingTier=Standard_S1 capacity=1 serviceMode=Default
{
  "id": "/subscriptions/71fa0172-ce90-403c-94a9-14ce1e88f56a/resourceGroups/rg_eastus_77623_1_1677198009499/providers/Microsoft.Resources/deployments/mywhizlabdeployment3",
  "location": null,
  "name": "mywhizlabdeployment3",
  "properties": {
    "correlationId": "6f6a3fe8-c604-41cb-967f-d26dd8cc20da",
    "debugSetting": null,
    "dependencies": [],
    "duration": "PT1M6.0526246S",
    "error": null,
    "mode": "Incremental",
    "onErrorDeployment": null,
    "outputResources": [
      {
        "id": "/subscriptions/71fa0172-ce90-403c-94a9-14ce1e88f56a/resourceGroups/rg_eastus_77623_1_1677198009499/providers/Microsoft.SignalRService/signalR/whizlabsignalr1",
        "resourceGroup": "rg_eastus_77623_1_1677198009499"
      }
    ],
    "outputs": null,
    "parameters": {
      "allowedOrigins": {
        "type": "Array",
        "value": [
          "*"
        ]
      },
      "capacity": {
        "type": "Int",
        "value": 1
      },
      "enableConnectivityLogs": {
        "type": "Bool",
        "value": true
      },
      "enableLiveTrace": {
        "type": "Bool",
        "value": true
      },
      "enableMessagingLogs": {
        "type": "Bool",
        "value": true
      },
      "location": {
        "type": "String",
        "value": "eastus"
      },
      "name": {
        "type": "String",
        "value": "whizlabsignalr1"
      },
      "pricingTier": {
        "type": "String",
        "value": "Standard_S1"
      },
      "serviceMode": {
        "type": "String",
        "value": "Default"
      }
    },
    "parametersLink": null,
    "providers": [
      {
        "id": null,
        "namespace": "Microsoft.SignalRService",
        "providerAuthorizationConsentState": null,
        "registrationPolicy": null,
        "registrationState": null,
        "resourceTypes": [
          {
            "aliases": null,
            "apiProfiles": null,
            "apiVersions": null,
            "capabilities": null,
            "defaultApiVersion": null,
            "locationMappings": null,
            "locations": [
              "eastus"
            ],
            "properties": null,
            "resourceType": "signalR",
            "zoneMappings": null
          }
        ]
      }
    ],
    "provisioningState": "Succeeded",
    "templateHash": "15362848402984270018",
    "templateLink": null,
    "timestamp": "2023-02-24T00:38:51.941507+00:00",
    "validatedResources": null
  },
  "resourceGroup": "rg_eastus_77623_1_1677198009499",
  "tags": null,
  "type": "Microsoft.Resources/deployments"
}