#Lab_09c_Implement_Azure_Kubernetes_Service.ps1
<#
labuser_77623_56181153@instructorwhizlabs.onmicrosoft.com
rg_eastus_77623_1_1667870125478
$FE!0cYJplH2kb?8
#>
$RESOURCE_GROUP='rg_eastus_77623_1_1667870125478'
$AKS_CLUSTER='az104-9c-aks1'
az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER
#Merged "az104-9c-aks1" as current context in /home/labuser_77623_12805024/.kube/config
kubectl get nodes
<#
NAME                                STATUS   ROLES   AGE   VERSION
aks-agentpool-42467080-vmss000000   Ready    agent   64m   v1.23.12
#>

kubectl create deployment nginx-deployment --image=nginx
#deployment.apps/nginx-deployment created

kubectl get pods
<#
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-794f656f8b-zljw6   1/1     Running   0          59s
#>

kubectl get deployment
<#
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   1/1     1            1           3m37s
#>
service/nginx-deployment exposed

kubectl get service
<#
NAME               TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)        AGE
kubernetes         ClusterIP      10.0.0.1       <none>          443/TCP        73m
nginx-deployment   LoadBalancer   10.0.228.228   20.72.170.114   80:32309/TCP   49s
#>
#scale the deployment by increasing of the number of pods to 2:
kubectl scale --replicas=2 deployment/nginx-deployment
<#deployment.apps/nginx-deployment scaled#>

#run the following to verify the outcome of scaling the deployment:
kubectl get pods

#run the following to scale out the cluster by increasing the number of nodes to 2:
az aks scale --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER --node-count 2

#run the following to verify the outcome of scaling the cluster:
kubectl get nodes

#run the following to scale the deployment
kubectl scale --replicas=10 deployment/nginx-deployment

#un the following to verify the outcome of scaling the deployment
kubectl get nodes

#run the following to review the pods distribution across cluster nodes
kubectl get pod -o=custom-columns=NODE:.spec.nodeName,POD:.metadata.name

<#
NODE                                POD
aks-agentpool-42467080-vmss000000   nginx-deployment-794f656f8b-6g9bt
aks-agentpool-42467080-vmss000000   nginx-deployment-794f656f8b-7hp6b
aks-agentpool-42467080-vmss000000   nginx-deployment-794f656f8b-g8zrt
aks-agentpool-42467080-vmss000001   nginx-deployment-794f656f8b-jhljm
aks-agentpool-42467080-vmss000000   nginx-deployment-794f656f8b-kr82m
aks-agentpool-42467080-vmss000001   nginx-deployment-794f656f8b-mfmj6
aks-agentpool-42467080-vmss000001   nginx-deployment-794f656f8b-n5x7m
aks-agentpool-42467080-vmss000001   nginx-deployment-794f656f8b-rwfld
aks-agentpool-42467080-vmss000001   nginx-deployment-794f656f8b-z6qcf
aks-agentpool-42467080-vmss000000   nginx-deployment-794f656f8b-zljw6
#>

kubectl delete deployment nginx-deployment