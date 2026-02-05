echo "Clearing Helm releases..."
helm uninstall kube-prometheus-stack -n monitoring
helm uninstall loki-stack -n logging
# helm uninstall openstack-cinder-csi -n kube-system
# helm uninstall openstack-cloud-controller-manager -n kube-system
# helm uninstall rke2-cilium -n kube-system
# helm uninstall rke2-coredns -n kube-system
# helm uninstall rke2-metrics-server -n kube-system
# helm uninstall rke2-snapshot-controller -n kube-system
# helm uninstall rke2-snapshot-controller-crd -n kube-system 
# helm uninstall rke2-snapshot-validation-webhook -n kube-system
# helm uninstall velero -n velero

# Probleme:
# Dadurch, dass die Helm releases im Manifests Ordner liegen, werden sie nicht richtig gelöscht und starten wieder neu.
# Wenn sich Terraform Destroy aufhängt, paralell in Openstack Loadbalancer löschen und die Ports im Netzwerk k8s.

# helm uninstall argocd -n argocd

echo "Try 'terraform destroy -auto-approve' to remove all infrastructure created by Terraform."

