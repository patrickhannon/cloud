
#https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-powershell
<#
labuser_77623_56181153@instructorwhizlabs.onmicrosoft.com
rg_eastus_77623_1_1667870125478
$FE!0cYJplH2kb?8
#>
$myResourceGroup ="rg_eastus_77623_1_1667870125478"
$myAKSCluster ="az104kubepjh"
$location ="East US"

New-AzAksCluster -ResourceGroupName $myResourceGroup -Name $myAKSCluster -NodeCount 3 -GenerateSshKey -WorkspaceResourceId "Workspace_rg_eastus_77623_1_1667870125478"
Import-AzAksCredential -ResourceGroupName $myResourceGroup -Name $myAKSCluster
#Import-AzAksCredential -ResourceGroupName $myResourceGroup -Name "az104kubepjh"

kubectl get nodes
<#
NAME                                STATUS   ROLES   AGE     VERSION
aks-agentpool-11847317-vmss000000   Ready    agent   5m28s   v1.23.12
aks-agentpool-11847317-vmss000001   Ready    agent   5m40s   v1.23.12
aks-agentpool-11847317-vmss000002   Ready    agent   5m36s   v1.23.12
#>
#https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough
kubectl apply -f azure-vote.yaml
<#
deployment.apps/azure-vote-back created
service/azure-vote-back created
deployment.apps/azure-vote-front created
service/azure-vote-front created
#>
kubectl get service azure-vote-front --watch
<#
NAME               TYPE           CLUSTER-IP    EXTERNAL-IP    PORT(S)        AGE
azure-vote-front   LoadBalancer   10.0.234.75   20.237.86.89   80:30064/TCP   13s
#>
kubectl get service
<#
NAME               TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)        AGE
azure-vote-back    ClusterIP      10.0.212.239   <none>         6379/TCP       6m27s
azure-vote-front   LoadBalancer   10.0.234.75    20.237.86.89   80:30064/TCP   6m27s
kubernetes         ClusterIP      10.0.0.1       <none>         443/TCP        13m
#>
kubectl get pods
<#
NAME                                READY   STATUS    RESTARTS   AGE
azure-vote-back-59cb7dc555-d5kbc    1/1     Running   0          6m20s
azure-vote-front-5f4d7db9c8-tzl5t   1/1     Running   0          6m20s
#>
kubectl get pods -o wide
<#
NAME                                READY   STATUS    RESTARTS   AGE     IP           NODE                                NOMINATED NODE   READINESS GATES
azure-vote-back-59cb7dc555-d5kbc    1/1     Running   0          7m18s   10.244.0.5   aks-agentpool-11847317-vmss000001   <none>           <none>
azure-vote-front-5f4d7db9c8-tzl5t   1/1     Running   0          7m18s   10.244.1.6   aks-agentpool-11847317-vmss000002   <none>           <none>
#>
kubectl scale --replicas=3 deployment/azure-vote-front
<#
deployment.apps/azure-vote-front scaled
#>
kubectl get pods -o wide
<#
NAME                                READY   STATUS    RESTARTS   AGE    IP            NODE                                NOMINATED NODE   READINESS GATES
azure-vote-back-59cb7dc555-gvbwx    1/1     Running   0          101s   10.244.1.8    aks-agentpool-11847317-vmss000002   <none>           <none>
azure-vote-front-5f4d7db9c8-ftxz9   1/1     Running   0          59s    10.244.1.12   aks-agentpool-11847317-vmss000002   <none>           <none>
azure-vote-front-5f4d7db9c8-g2wcq   1/1     Running   0          59s    10.244.1.11   aks-agentpool-11847317-vmss000002   <none>           <none>
azure-vote-front-5f4d7db9c8-tzl5t   1/1     Running   0          11m    10.244.1.6    aks-agentpool-11847317-vmss000002   <none>           <none>
#>
az104containerpjh.d3evcpazhneyhuev.eastus.azurecontainer.io