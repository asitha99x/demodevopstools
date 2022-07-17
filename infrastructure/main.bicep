param webAppName string = uniqueString(resourceGroup().id)
param acrName string = toLower('acr${webAppName}')
param acrSku string

param location string = resourceGroup().location

module containerRegistry 'containerRegistry.bicep' = {
  name: 'containerRegistry'
  params: {
    registryLocation: location 
    registryName: acrName
    registrySku: acrSku
  }
}
