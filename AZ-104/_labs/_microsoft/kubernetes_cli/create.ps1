<#
https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-cli

labuser_77623_69815500@instructorwhizlabs.onmicrosoft.com
rg_eastus_77623_1_1668124537210
#7wMG36E!k4*0nA

Create a resource group
kubernetes
az group create --name myResourceGroup --location eastus
labuser_77623_69815500@instructorwhizlabs.onmicrosoft.com Pay-As-You-Go    82676786-5bc7-43c6-b8f8-b3ee02b0b5f3 AzureC…
#>
#turn off monitoring 
az aks create -g rg_eastus_77623_1_1668124537210 -n aksdotnetcorecluster --enable-managed-identity --node-count 1 --generate-ssh-keys
<#
{
  "aadProfile": null,
  "addonProfiles": null,
  "agentPoolProfiles": [
    {
      "availabilityZones": null,
      "count": 1,
      "creationData": null,
      "currentOrchestratorVersion": "1.23.12",
      "enableAutoScaling": false,
      "enableEncryptionAtHost": false,
      "enableFips": false,
      "enableNodePublicIp": false,
      "enableUltraSsd": false,
      "gpuInstanceProfile": null,
      "hostGroupId": null,
      "kubeletConfig": null,
      "kubeletDiskType": "OS",
      "linuxOsConfig": null,
      "maxCount": null,
      "maxPods": 110,
      "minCount": null,
      "mode": "System",
      "name": "nodepool1",
      "nodeImageVersion": "AKSUbuntu-1804gen2containerd-2022.10.24",
      "nodeLabels": null,
      "nodePublicIpPrefixId": null,
      "nodeTaints": null,
      "orchestratorVersion": "1.23.12",
      "osDiskSizeGb": 128,
      "osDiskType": "Managed",
      "osSku": "Ubuntu",
      "osType": "Linux",
      "podSubnetId": null,
      "powerState": {
        "code": "Running"
      },
      "provisioningState": "Succeeded",
      "proximityPlacementGroupId": null,
      "scaleDownMode": null,
      "scaleSetEvictionPolicy": null,
      "scaleSetPriority": null,
      "spotMaxPrice": null,
      "tags": null,
      "type": "VirtualMachineScaleSets",
      "upgradeSettings": {
        "maxSurge": null
      },
      "vmSize": "Standard_DS2_v2",
      "vnetSubnetId": null,
      "workloadRuntime": null
    }
  ],
  "apiServerAccessProfile": null,
  "autoScalerProfile": null,
  "autoUpgradeProfile": null,
  "azurePortalFqdn": "aksdotnetc-rgeastus77623116-71fa01-4de8be33.portal.hcp.eastus.azmk8s.io",
  "currentKubernetesVersion": "1.23.12",
  "disableLocalAccounts": false,
  "diskEncryptionSetId": null,
  "dnsPrefix": "aksdotnetc-rgeastus77623116-71fa01",
  "enablePodSecurityPolicy": null,
  "enableRbac": true,
  "extendedLocation": null,
  "fqdn": "aksdotnetc-rgeastus77623116-71fa01-4de8be33.hcp.eastus.azmk8s.io",
  "fqdnSubdomain": null,
  "httpProxyConfig": null,
  "id": "/subscriptions/71fa0172-ce90-403c-94a9-14ce1e88f56a/resourcegroups/rg_eastus_77623_1_1668124537210/providers/Microsoft.ContainerService/managedClusters/aksdotnetcorecluster",
  "identity": {
    "principalId": "a96becb2-09be-4e89-bfd2-a911c194f7a2",
    "tenantId": "82676786-5bc7-43c6-b8f8-b3ee02b0b5f3",
    "type": "SystemAssigned",
    "userAssignedIdentities": null
  },
  "identityProfile": {
    "kubeletidentity": {
      "clientId": "aab2b8bd-82e0-4a87-a579-c9268ba72c93",
      "objectId": "7755753c-fcab-47ae-8380-239e57c0c0c9",
      "resourceId": "/subscriptions/71fa0172-ce90-403c-94a9-14ce1e88f56a/resourcegroups/MC_rg_eastus_77623_1_1668124537210_aksdotnetcorecluster_eastus/providers/Microsoft.ManagedIdentity/userAssignedIdentities/aksdotnetcorecluster-agentpool"
    }
  },
  "kubernetesVersion": "1.23.12",
  "linuxProfile": {
    "adminUsername": "azureuser",
    "ssh": {
      "publicKeys": [
        {
          "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDK5SAJPMB2ANnDu0db7U1pnMVjJPFuR7zK4jPwsRhldftilbw81wJZ7wgOp5FBVODd4XEZxG5faB+BHXW8q4KUDaPlVejfD+jNvRV9CVqB2UIm9+O9TP1PC29Gca14TGx71cDClJe6VC3vqu4WW0l3GTtkFtz2XC+G0rPv20vJZ4EiYf2IHqHw/KQf7S/jTeZ6rAAvExXGTD1Bret9pNgpremELhloq0GV4kjD/yemt//L0R1u10b1AQL1DPq04QLxnNfB4A8KpQBUsG/yQ7fzrMegIyseavsPnsnx9RI5sCcLnIqZQcv2nV0jIyM5MBbR9AYCetSuycG5m8ZeeHQx"
        }
      ]
    }
  },
  "location": "eastus",
  "maxAgentPools": 100,
  "name": "aksdotnetcorecluster",
  "networkProfile": {
    "dnsServiceIp": "10.0.0.10",
    "dockerBridgeCidr": "172.17.0.1/16",
    "ipFamilies": [
      "IPv4"
    ],
    "loadBalancerProfile": {
      "allocatedOutboundPorts": null,
      "effectiveOutboundIPs": [
        {
          "id": "/subscriptions/71fa0172-ce90-403c-94a9-14ce1e88f56a/resourceGroups/MC_rg_eastus_77623_1_1668124537210_aksdotnetcorecluster_eastus/providers/Microsoft.Network/publicIPAddresses/9506a661-32b1-4b33-b4fc-88c83f04f646",
          "resourceGroup": "MC_rg_eastus_77623_1_1668124537210_aksdotnetcorecluster_eastus"
        }
      ],
      "enableMultipleStandardLoadBalancers": null,
      "idleTimeoutInMinutes": null,
      "managedOutboundIPs": {
        "count": 1,
        "countIpv6": null
      },
      "outboundIPs": null,
      "outboundIpPrefixes": null
    },
    "loadBalancerSku": "Standard",
    "natGatewayProfile": null,
    "networkMode": null,
    "networkPlugin": "kubenet",
    "networkPolicy": null,
    "outboundType": "loadBalancer",
    "podCidr": "10.244.0.0/16",
    "podCidrs": [
      "10.244.0.0/16"
    ],
    "serviceCidr": "10.0.0.0/16",
    "serviceCidrs": [
      "10.0.0.0/16"
    ]
  },
  "nodeResourceGroup": "MC_rg_eastus_77623_1_1668124537210_aksdotnetcorecluster_eastus",
  "oidcIssuerProfile": {
    "enabled": false,
    "issuerUrl": null
  },
  "podIdentityProfile": null,
  "powerState": {
    "code": "Running"
  },
  "privateFqdn": null,
  "privateLinkResources": null,
  "provisioningState": "Succeeded",
  "publicNetworkAccess": null,
  "resourceGroup": "rg_eastus_77623_1_1668124537210",
  "securityProfile": {
    "azureKeyVaultKms": null,
    "defender": null
  },
  "servicePrincipalProfile": {
    "clientId": "msi",
    "secret": null
  },
  "sku": {
    "name": "Basic",
    "tier": "Free"
  },
  "storageProfile": {
    "blobCsiDriver": null,
    "diskCsiDriver": {
      "enabled": true
    },
    "fileCsiDriver": {
      "enabled": true
    },
    "snapshotController": {
      "enabled": true
    }
  },
  "systemData": null,
  "tags": null,
  "type": "Microsoft.ContainerService/ManagedClusters",
  "windowsProfile": null
}
#>
#Connect to the cluster
az aks install-cli
<#
Please add "C:\Users\patri\.azure-kubelogin" to your search PATH so the `kubelogin.exe` can be found. 2 options:
    1. Run "set PATH=%PATH%;C:\Users\patri\.azure-kubelogin" or "$env:path += 'C:\Users\patri\.azure-kubelogin'" for PowerShell. This is good for the current command session.
    2. Update system PATH environment variable by following "Control Panel->System->Advanced->Environment Variables", and re-open the command window. You only need to do it once
#>
#Configure kubectl to connect to your Kubernetes cluster using the az aks get-credentials command.
az aks get-credentials --resource-group rg_eastus_77623_1_1668124537210 --name aksdotnetcorecluster
<#
Merged "aksdotnetcorecluster" as current context in /home/labuser_77623_69815500/.kube/config
#>
kubectl get nodes
<#
PS /home/labuser_77623_69815500> kubectl get nodes
NAME                                STATUS   ROLES   AGE   VERSION
aks-nodepool1-21390645-vmss000000   Ready    agent   16m   v1.23.12

deploy the application
#>
kubectl apply -f azure-vote.yaml
<#
deployment.apps/azure-vote-back created
service/azure-vote-back created
deployment.apps/azure-vote-front created
service/azure-vote-front created

test the application
#>
kubectl get service azure-vote-front --watch
<#
NAME               TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)        AGE
azure-vote-front   LoadBalancer   10.0.228.101   20.85.163.146   80:30528/TCP   3m21s
#>