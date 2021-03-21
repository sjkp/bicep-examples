targetScope = 'subscription'
param domainNames array 
param appServicePlanName string
param appServicePlanResourceGroupName string
param appName string
param appResourceGroupName string

module certificate './certificate.bicep' = {
  name: 'certificate'
  scope: resourceGroup(appServicePlanResourceGroupName)
  params: {
    appServicePlanName: appServicePlanName
    domainNames: domainNames
  }
}

// var certs = [
//   certificate.outputs.thumbprint1
//   certificate.outputs.thumbprint2
// ]

module sslbindings './sslbindings.bicep' = {
  name: 'sslbindings'
  scope: resourceGroup(appResourceGroupName)
  params: {
    appName: appName
    certificates: certificate.outputs.thumbprints
  }
}