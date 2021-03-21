param domainNames array 
param appServicePlanName string
param location string = resourceGroup().location


resource certificates 'Microsoft.Web/certificates@2020-06-01' = [for domainName in domainNames: {  
  name: domainName
  location: location
  properties: {
    canonicalName: domainName
    serverFarmId: resourceId('Microsoft.Web/serverfarms', appServicePlanName)
    domainValidationMethod: 'http-token'
  }
}]

//output thumbprint1 object = certificates[0]
//output thumbprint2 object = certificates[1]

output thumbprints array = [for i in range(0,length(domainNames)): certificates[i]]