echo "Clearing Helm releases..."
helm uninstall loki-stack -n logging
helm uninstall openstack-cinder-csi -n kube-system
helm uninstall kube-prometheus-stack -n monitoring

echo "Terraform destroying resources..."
terraform destroy -auto-approve

echo "All resources have been cleared."
