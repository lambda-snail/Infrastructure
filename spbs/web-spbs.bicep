param webAppName string
param webAppLocation string
param serverFarmId string

var linuxFxVersion = 'DOTNETCORE|7.0'

resource webApp 'Microsoft.Web/sites@2021-02-01' = {
  name: webAppName
  location: webAppLocation
  kind: 'app,linux'
  properties: {
    httpsOnly: true
    serverFarmId: serverFarmId
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      minTlsVersion: '1.2'
      webSocketsEnabled: true
    }
  }
  identity: {
    type: 'SystemAssigned'
  }
}
