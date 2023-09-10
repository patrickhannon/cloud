#Create a VM with a UserData value
## VM Account phannon joshua36634_
$VMLocalAdminUser = "phannon";
$VMLocalAdminSecurePassword = ConvertTo-SecureString "joshua36634_" -AsPlainText -Force;

## Azure Account
$LocationName = "eastus";
$ResourceGroupName = "rg_eastus_77623_1_16643653201361";

# VM Profile & Hardware
#$VMName = 'v' + $ResourceGroupName;
$VMName = "az104vmpjh"
$domainNameLabel = "d1" + $ResourceGroupName;
$Credential = New-Object System.Management.Automation.PSCredential ($VMLocalAdminUser, $VMLocalAdminSecurePassword);

# Create UserData value
$text = "text for UserData pjh";
$bytes = [System.Text.Encoding]::Unicode.GetBytes($text);
$userData = [Convert]::ToBase64String($bytes);

# Create VM
New-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -Credential $cred -DomainNameLabel $domainNameLabel -UserData $userData;
$vm = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -UserData;