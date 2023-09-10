#C:\Users\patri\OneDrive\___Docs\__Cloud\___azure\____labs\whizlabs\alerts-create-new-alert-rule

# script.ps1
#   param(
#       [string]$arg1,
#       [string]$arg2
#   )
#   Write-Host This is a sample script with parameters $arg1 and $arg2

az vm run-command invoke  --command-id RunPowerShellScript --name vm1pjh -g rg_eastus_77623_1_1680522760162 --scripts @script.ps1 --parameters "arg1=somefoo" "arg2=somebar"