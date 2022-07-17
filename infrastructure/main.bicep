param appServicePlanName string = 'asp-devops4252'
param appServiceName string = 'app-devops4252'
param appServicePlanSkuName string
param appServicePlanInstanceCount int

var appServiceSlotName = 'staging'

param location string = resourceGroup().location

module appServicePlan 'appServicePlan.bicep' = {
  name: 'appServicePlan'
  params: {
    appServicePlanLocation: location
    appServicePlanName: appServicePlanName
    appServicePlanSkuName: appServicePlanSkuName
    appServicePlanCapacity: appServicePlanInstanceCount
  }
}

module appService 'appService.bicep' = {
  name: 'appService'
  params: {
    appServiceLocation: location 
    appServiceName: appServiceName
    serverFarmId: appServicePlan.outputs.appServicePlanId
    appServiceSlotName: appServiceSlotName
  }
}
