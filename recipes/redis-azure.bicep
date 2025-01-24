param context object

param location string = resourceGroup().location

resource redis 'Microsoft.Cache/redis@2024-11-01' = {
  name: 'redis-${uniqueString(context.resource.id)}'
  location: location
  properties: {
    sku: {
      name: 'Basic'
      capacity: 1
      family: 'P'
    }
    enableNonSslPort: true
    minimumTlsVersion: '1.2'
  }
}

output result object = {
  values: {
    host: redis.properties.hostName
    port: redis.properties.port
    username: ''
  }
  secrets: {
    #disable-next-line outputs-should-not-contain-secrets
    password: redis.listKeys().primaryKey
  }
}
