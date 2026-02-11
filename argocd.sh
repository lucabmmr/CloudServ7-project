#!/usr/bin/env bash

set -e
set -o pipefail

echo "KUBECONFIG"
export KUBECONFIG="$PWD/cloudserv7-k8s.rke2.yaml"

if [[ ! -f "$KUBECONFIG" ]]; then
  echo "Fehler: KUBECONFIG-Datei nicht gefunden!"
  exit 1
fi

echo "Ausführungsrechte install-argocd.sh"
chmod +x install-argocd.sh

echo "install-argocd.sh ausführen"
sed 's/\r$//' install-argocd.sh | bash -s argocd

echo "Wartet, bis Namespace argocd existiert"
until kubectl get namespace argocd >/dev/null 2>&1; do
  sleep 2
done

echo "Wartet, bis argocd-server Service verfügbar ist"
until kubectl get service argocd-server -n argocd >/dev/null 2>&1; do
  sleep 2
done

echo "Wendet argocd Konfiguration an"
kubectl apply -f argocd

echo "Fertig!"

kubectl get svc -n argocd

$export TARGET_IP=$(kubectl get svc express-web -n argocd -o jsonpath='{.status.loadBalancer.ingress[0].ip}')