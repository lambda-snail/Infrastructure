param appServicePlanName string
param location string = resourceGroup().location

var sku = 'F1' // The SKU of App Service Plan

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
  kind: 'linux'
}

output appServicePlanId string = resourceId('Microsoft.Web/serverfarms', appServicePlanName)
