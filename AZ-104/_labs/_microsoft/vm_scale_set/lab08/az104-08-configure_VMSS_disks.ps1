<#
labuser_77623_83221319@instructorwhizlabs.onmicrosoft.com
rg_eastus_77623_1_1667514592783
u705!$%AFlL1ykoG#
#>
$rgName = 'rg_eastus_77623_1_1667514592783'
$vmssName = 'az10408vmss0'
$vmss = Get-AzVmss -ResourceGroupName $rgName -VMScaleSetName $vmssName

$publicSettings = @{
	"fileUris" = (,"https://raw.githubusercontent.com/Azure-Samples/compute-automation-configurations/master/prepare_vm_disks.ps1");
	"commandToExecute" = "powershell -ExecutionPolicy Unrestricted -File prepare_vm_disks.ps1"
}

Add-AzVmssExtension -VirtualMachineScaleSet $vmss -Name "customScript" -Publisher "Microsoft.Compute" -Type "CustomScriptExtension" -TypeHandlerVersion 1.8 -Setting $publicSettings

# Update the scale set and apply the Custom Script Extension to the VM instances
Update-AzVmss -ResourceGroupName $rgName -Name $vmssName -VirtualMachineScaleSet $vmss