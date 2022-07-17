param appServicePlanName string
param appServicePlanLocation string
param appServicePlanSkuName string
param appServicePlanCapacity int

resource appServicePlan 'Microsoft.Web/serverfarms@2021-03-01' = {
  name: appServicePlanName
  location: appServicePlanLocation
  sku: {
    tier: 'Standard'
    size: 'S1'
    family: 'S'
    name: appServicePlanSkuName
    capacity: appServicePlanCapacity
  }
  kind: 'app'
  properties: {
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: false
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
  }
}

output appServicePlanId string = appServicePlan.id
