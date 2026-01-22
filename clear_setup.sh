echo "Clearing Helm releases..."
helm uninstall kube-prometheus-stack -n monitoring
helm uninstall loki-stack -n logging
helm uninstall openstack-cinder-csi -n kube-system
helm uninstall openstack-cloud-controller-manager -n kube-system
helm uninstall rke2-cilium -n kube-system
helm uninstall rke2-coredns -n kube-system
helm uninstall rke2-metrics-server -n kube-system
helm uninstall rke2-snapshot-controller -n kube-system
helm uninstall rke2-snapshot-controller-crd -n kube-system 
helm uninstall rke2-snapshot-validation-webhook -n kube-system
helm uninstall velero -n velero

# Deleting Kubernetes resources
echo "Deleting Kubernetes resources..."
kubectl delete -f ./manifests/deployment.yaml
kubectl delete -f ./manifests/service.yaml

# helm uninstall argocd -n argocd

echo "Terraform destroying resources..."
terraform destroy -auto-approve

echo "All resources have been cleared."
