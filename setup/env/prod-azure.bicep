extension radius

param name string

param subscriptionId string
param resourceGroup string


resource env 'Applications.Core/environments@2023-10-01-preview' = {
  name: name
  properties: {
    compute: {
      kind: 'kubernetes'
      namespace: 'default'
    }

    providers: {
      azure:{
        scope: '/subscriptions/${subscriptionId}/resourceGroups/${resourceGroup}'
      }
    }
    recipes: {
      'Applications.Datastores/redisCaches@2023-10-01-preview':{
      default:{
          templateKind: 'bicep'
          templatePath: 'fresh630ad3.azurecr.io/recipes/redis-azure:0.32'
        }        
      }
    }
  }
}


