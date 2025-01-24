resource_group="radius-rg"
subscription_id="d3dfcd2e-72de-45e0-aef0-47afc74957e8"

# Get the K8S_CLUSTER_NAME
k8s_cluster_name=$(az aks list --resource-group $resource_group --query "[0].name" -o tsv)

# Get the OIDC_ISSUER_URL
oidc_issuer_url=$(az aks show --resource-group $resource_group --name $k8s_cluster_name --query "oidcIssuerProfile.issuerUrl" -o tsv)

echo "K8S_CLUSTER_NAME: $k8s_cluster_name"
echo "AZURE_RESOURCE_GROUP: $resource_group"
echo "AZURE_SUBSCRIPTION_ID: $subscription_id"
echo "OIDC_ISSUER_URL: $oidc_issuer_url"