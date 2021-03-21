param certificates array
param appName string
param location string = resourceGroup().location

resource hostNameSsl 'Microsoft.Web/sites@2020-06-01' = {
  name: appName
  location: location
  properties: {
    hostNameSslStates: [for certificate in certificates: {
      
        name: certificate.properties.canonicalName
        sslState: 'SniEnabled'
        thumbprint: certificate.properties.thumbprint
        toUpdate: true
      }]
  }
}