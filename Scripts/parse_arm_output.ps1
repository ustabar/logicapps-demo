$result = ConvertFrom-Json $ENV:deploymentOutput

$ehConnectionString = $result.eventhubsConnectionString.value
$cosmosdbAccessKey = $result.documentdbAccessKey.value

Write-Host "##vso[task.setvariable variable=cosmosdbAccessKey]$cosmosdbAccessKey"
Write-Host "##vso[task.setvariable variable=ehConnectionString]$ehConnectionString"