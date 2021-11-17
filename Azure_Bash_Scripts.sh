--"Install Powershell on your Local Machine"
https://github.com/PowerShell/PowerShell

$PSVersionTable.PSVersion
Get-Module -Name Az -ListAvailable

--"Install Azure Cli"
--"https://docs.microsoft.com/en-us/cli/azure/install-azure-cli"
$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

az login

--"Install-Module -Name Az -AllowClobber -Scope AllUsers"

















----------------------------------------------
//Azure Powershell
//CLI for Windows
$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

//

Install-Module -Name Az -AllowClobber -Scope CurrentUser
or
Install-Module -Name Az -AllowClobber -Scope AllUsers

Get-InstalledModule -Name Az -Allversions | select name,version

Connect-AzAccount

Get-AzSubscription

$context = Get-AzSubcription -SubcriptionId
Get-AzSubscription -SubscriptionId "e7209e54-dce7-45d4-a4e1-b763c30586da" -TenantId "f8204598-1a26-4392-b3ef-29e61c3293db" | Set-AzContext

New-AzResourceGroup -Name smresourcegrp -location EastUS


New-AzVM -ResourceGroupName "smresourcegrp" -Name "smdev" -Location "EastUS" -virtualNetworkName "smvnet" -SubnetName "default" -SecurityGroupName "smsecuritygroup" -publicIpAddressName "myipaddress" -openPorts 80,443,3389

Stop-AzVM -ResourceGroupName "smresourcegrp" -Name "smdev"

Start-AzVM -ResourceGroupName "smresourcegrp" -Name "smdev"

Remove-AzureRmResourceGroup -Name "smresourcegrp"



az group create --name shubhamgroup --location eastus

az container create --resource-group shubhamgroup --name democontainer --os-type Windows --image mcr.microsoft.com/windows/servercore/iis:nanoserver --dns-name-label shubhamdemo --ports 80
az container create --resource-group myResourceGroup --name mycontainer --image mcr.microsoft.com/azuredocs/aci-helloworld --dns-name-label aci-demo --ports 80

az container attach --resource-group shubhamgroup --name democontainer

az container delete --resource-group shubhamgroup --name democontainer
az group delete --name shubhamgroup



-------------------------------
Other SQL things:-
View is
Logical Entity of table

Read Only
Table will not affect

Get Combined Data 
from Multiple table

Entity

sel
----------------------------