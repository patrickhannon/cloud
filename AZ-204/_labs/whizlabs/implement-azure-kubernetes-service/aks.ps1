#https://www.whizlabs.com/labs/implement-azure-kubernetes-service
#labuser_77623_17926453@instructorwhizlabs.onmicrosoft.com
#!8n6GH*2m$%7MrR?Oi
#rg_eastus_77623_1_168294104663
az aks get-credentials --resource-group 'rg_eastus_77623_1_168294104663' --name 'whizkubcluster'
#Merged "whizkubcluster" as current context in /home/labuser_77623_17926453/.kube/config
kubectl get nodes

# NODE                                POD
# aks-agentpool-37706261-vmss000000   nginx-deployment-5fbdf85c67-2vpbb
# aks-agentpool-37706261-vmss000000   nginx-deployment-5fbdf85c67-7pkld
# aks-agentpool-37706261-vmss000000   nginx-deployment-5fbdf85c67-c6rwk
# aks-agentpool-37706261-vmss000001   nginx-deployment-5fbdf85c67-ch997
# aks-agentpool-37706261-vmss000001   nginx-deployment-5fbdf85c67-fdmx8
# aks-agentpool-37706261-vmss000000   nginx-deployment-5fbdf85c67-fr9bn
# aks-agentpool-37706261-vmss000001   nginx-deployment-5fbdf85c67-hncjn
# aks-agentpool-37706261-vmss000001   nginx-deployment-5fbdf85c67-khsfb
# aks-agentpool-37706261-vmss000001   nginx-deployment-5fbdf85c67-m9wlb
# aks-agentpool-37706261-vmss000000   nginx-deployment-5fbdf85c67-w2vh5
#Task 1: Sign in to Azure Portal DONE
#Task 2: Deploy an AKS cluster DONE
#Task 3: Deploy a pod into the AKS cluster DONE
#11:11 AM Sunday, September 10, 2023
az aks get-credentials --resource-group 'rg_eastus_77623_1_169436232616' --name 'whizkubcluster'
#Merged "whizkubcluster" as current context in C:\Users\patri\.kube\config
kubectl get nodes
#NAME                                STATUS   ROLES   AGE   VERSION
#aks-agentpool-14529483-vmss000000   Ready    agent   22m   v1.26.6
#aks-agentpool-14529483-vmss000001   Ready    agent   22m   v1.26.6
kubectl create deployment nginx-deployment --image=nginx
#deployment.apps/nginx-deployment created
kubectl get pods
#NAME                                READY   STATUS    RESTARTS   AGE
#nginx-deployment-55888b446c-7tlfn   1/1     Running   0          41s
kubectl get deployment
#NAME               READY   UP-TO-DATE   AVAILABLE   AGE
#nginx-deployment   1/1     1            1           73s
kubectl expose deployment nginx-deployment --port=80 --type=LoadBalancer
#service/nginx-deployment exposed
kubectl get service
#NAME               TYPE           CLUSTER-IP    EXTERNAL-IP     PORT(S)        AGE
#kubernetes         ClusterIP      10.0.0.1      <none>          443/TCP        27m
#nginx-deployment   LoadBalancer   10.0.159.70   20.120.73.179   80:32198/TCP   23s

#Task 4: Scale containerized workloads in the AKS cluster
kubectl scale --replicas=2 deployment/nginx-deployment
#deployment
#deployment.apps/nginx-deployment scaled
kubectl get pods
#NAME                                READY   STATUS    RESTARTS   AGE
#nginx-deployment-55888b446c-7tlfn   1/1     Running   0          9m47s
#nginx-deployment-55888b446c-l26hv   1/1     Running   0          66s

az aks scale --resource-group 'rg_eastus_77623_1_169436232616' --name 'whizkubcluster' --node-count 2
<#
{
  "aadProfile": null,
  "addonProfiles": {
    "azureKeyvaultSecretsProvider": {
      "config": null,
      "enabled": false,
      "identity": null
    },
    "azurepolicy": {
      "config": null,
      "enabled": false,
      "identity": null
    }
  },
  "agentPoolProfiles": [
    {
      "availabilityZones": [
        "1",
        "2",
        "3"
      ],
      "count": 2,
      "creationData": null,
      "currentOrchestratorVersion": "1.26.6",
      "enableAutoScaling": false,
      "enableEncryptionAtHost": null,
      "enableFips": false,
      "enableNodePublicIp": false,
      "enableUltraSsd": null,
      "gpuInstanceProfile": null,
      "hostGroupId": null,
      "kubeletConfig": null,
      "kubeletDiskType": "OS",
      "linuxOsConfig": null,
      "maxCount": null,
      "maxPods": 110,
      "minCount": null,
      "mode": "System",
      "name": "agentpool",
      "nodeImageVersion": "AKSUbuntu-2204gen2containerd-202308.22.0",
      "nodeLabels": null,
      "nodePublicIpPrefixId": null,
      "nodeTaints": null,
      "orchestratorVersion": "1.26.6",
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
      "upgradeSettings": null,
      "vmSize": "Standard_B2s",
      "vnetSubnetId": null,
      "workloadRuntime": null
    }
  ],
  "apiServerAccessProfile": null,
  "autoScalerProfile": null,
  "autoUpgradeProfile": {
    "upgradeChannel": "patch"
  },
  "azurePortalFqdn": "whizkubcluster-dns-u18dd5jd.portal.hcp.eastus.azmk8s.io",
  "currentKubernetesVersion": "1.26.6",
  "disableLocalAccounts": false,
  "diskEncryptionSetId": null,
  "dnsPrefix": "whizkubcluster-dns",
  "enablePodSecurityPolicy": null,
  "enableRbac": true,
  "extendedLocation": null,
  "fqdn": "whizkubcluster-dns-u18dd5jd.hcp.eastus.azmk8s.io",
  "fqdnSubdomain": null,
  "httpProxyConfig": null,
  "id": "/subscriptions/71fa0172-ce90-403c-94a9-14ce1e88f56a/resourcegroups/rg_eastus_77623_1_169436232616/providers/Microsoft.ContainerService/managedClusters/whizkubcluster",
  "identity": {
    "principalId": "ad3c1bfa-d98b-4d1f-b22a-d58254784433",
    "tenantId": "82676786-5bc7-43c6-b8f8-b3ee02b0b5f3",
    "type": "SystemAssigned",
    "userAssignedIdentities": null
  },
  "identityProfile": {
    "kubeletidentity": {
      "clientId": "ea7b3525-98da-4a90-a7ae-a9eb3bdeab8e",
      "objectId": "86a78099-d8c6-4816-a630-61c3c9ed6905",
      "resourceId": "/subscriptions/71fa0172-ce90-403c-94a9-14ce1e88f56a/resourcegroups/MC_rg_eastus_77623_1_169436232616_whizkubcluster_eastus/providers/Microsoft.ManagedIdentity/userAssignedIdentities/whizkubcluster-agentpool"
    }
  },
  "kubernetesVersion": "1.26.6",
  "linuxProfile": null,
  "location": "eastus",
  "maxAgentPools": 100,
  "name": "whizkubcluster",
  "networkProfile": {
    "dnsServiceIp": "10.0.0.10",
    "dockerBridgeCidr": null,
    "ipFamilies": [
      "IPv4"
    ],
    "loadBalancerProfile": {
      "allocatedOutboundPorts": null,
      "effectiveOutboundIPs": [
        {
          "id": "/subscriptions/71fa0172-ce90-403c-94a9-14ce1e88f56a/resourceGroups/MC_rg_eastus_77623_1_169436232616_whizkubcluster_eastus/providers/Microsoft.Network/publicIPAddresses/6a20c26f-bfc8-40cd-b80b-cf373746bceb",
          "resourceGroup": "MC_rg_eastus_77623_1_169436232616_whizkubcluster_eastus"
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
    "networkPolicy": "calico",
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
  "nodeResourceGroup": "MC_rg_eastus_77623_1_169436232616_whizkubcluster_eastus",
  "podIdentityProfile": null,
  "powerState": {
    "code": "Running"
  },
  "privateFqdn": null,
  "privateLinkResources": null,
  "provisioningState": "Succeeded",
  "publicNetworkAccess": null,
  "resourceGroup": "rg_eastus_77623_1_169436232616",
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