
param storagePrefix string = 'testservice' 
param location string = resourceGroup().location

var storageAccountName = '${storagePrefix}${uniqueString(resourceGroup().id)}' 

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
