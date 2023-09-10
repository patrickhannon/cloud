#C:\Users\patri\OneDrive\___Docs\__Cloud\___azure\AZ-104 Prerequisites for Azure administrators\management_groups\Lab 02a Manage Subscriptions and RBAC

New-AzRoleDefinition -InputFile az104-02a-customRoleDefinition.json
<#
Name             : Support Request Contributor (Custom)
Id               : ac7fe7c3-cc80-4830-afe6-9a40e48379b3
IsCustom         : True
Description      : Allows to create support requests
Actions          : {Microsoft.Resources/subscriptions/resourceGroups/read, Microsoft.Support/*}
NotActions       : {}
DataActions      : {}
NotDataActions   : {}
AssignableScopes : {/providers/Microsoft.Management/managementGroups/az104-02-mg1,
                   /subscriptions/4aad3aaf-1575-4b1f-8c0d-e9e8c9563f09}
#>

