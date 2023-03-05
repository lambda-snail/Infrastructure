param appServicePlanName string
param appServicePlanResourceGroup string
param appServicePlanLocation string

param webAppName string
param webAppLocation string = resourceGroup().location

module appServiceModule 'core/asp-core-linux.bicep' = {
  name: 'appServicePlan'
  scope: resourceGroup(appServicePlanResourceGroup)
  params: {
    appServicePlanName: appServicePlanName
    location: appServicePlanLocation
  }
}

module webAppModule 'spbs/web-spbs.bicep' = {
  name: 'webApp'
  params: {
    webAppName: webAppName
    webAppLocation: webAppLocation
    serverFarmId: appServiceModule.outputs.appServicePlanId
  }
}
