param (
    [string]       $ResourceGroupName          = "DevSub01_EventHubs-BJD_RG",
    [string]       $ResourceLocation           = "centralus"
)  

$opts = @{
    Name                  = ("Deployment-{0}-{1}" -f $ResourceGroupName, $(Get-Date).ToString("yyyyMMddhhmmss"))
    ResourceGroupName     = $ResourceGroupName
    TemplateFile          = (Join-Path -Path ".." -ChildPath "Source\LogicAppsWithEventHub\LogicApp.json")
    TemplateParameterFile = (Join-Path -Path ".." -ChildPath "Source\LogicAppsWithEventHub\parameters\logicapp.parameters.local.json")
}

New-AzResourceGroup -Name $ResourceGroupName -Location $ResourceLocation -Verbose
New-AzResourceGroupDeployment @opts -verbose   