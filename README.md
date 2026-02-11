# CloudServ7-project
Cloud Services Projekt Gruppe 7: Zentraler dienst für installationen

> [!TIP]
> Keine abgabe von Doku -> Code wird abgegeben!
Eine Readme mit beschreibung welche datei quasi was macht.

## Dateien

> "main.tf" => Terraform Grundlage
-> Legt fest, welche Instanzen mit welcher Spezifikation gestartet werden
-> Definiert Worker und Controller

> "terraform.tfvars" => (Lokal) Variablen für Terraform
-> OpenStack anmeldedaten

Manifests (Ordner):

>"cloud-controller-openstack.yaml.tpl" => OpenStack Cloud Controller Management
-> Bindeglied zwischen Openstack und Kubernetes
-> für LoadBalancer über OpenStack, Node-Infos, Volumes / IPs

>"csi-cinder-sc.yaml.tpl" => CSI Block Storage
-> Persistente Volumes
-> Daten bleiben erhalten auch wenn Pods neu starten

>"csi-cinder-sc.yaml.tpl" => StorageClass Definition
-> Legt fest, welches Storage benutzt wird

>"csi-cinder-snapclass.yaml" => Volume Snapshot Class
-> Snapshots von persistenten Volumes
-> Grundlage für Backups über Velero

>"velero-ns.yaml" => Namespace für Velero
-> Backup und Restore von Volumes

>"velero.yaml.tpl" => Velero Deployment
-> Kubernetes Backups und Wiederherstellung

>"monitoring.yaml" => Prometheus Monitoring
-> Metriken und Cluster Überwachung

>"logging.yaml" => Loki Logging
-> Logs von Pods und Nodes 
-> Zentrale Log-Analyse

## manuelles stoppen der Ressourcen
Reihenfolge beachten, teilweise wichtig aufgrund von Abhängigkeiten
1. terraform destroy
2. Datenträger löschen
3. Floating IPs freigeben
4. Router löschen
5. Sicherheitsgruppen löschen (außer default)
6. Load Balancers löschen
7. Ports von cloudserv7-k8s-net (Netzwerk) löschen
8. cloudserv7-k8s-net löschen

Notwendige Ansicht, bevor das nächste Mal terraform apply ausgeführt werden sollte:#

## Starten von ArgoCD
1. chmod +x argocd.sh
2. ./argocd.sh
3. IP-Adresse im Browser aufrufen und einloggen

## Horizontal Pod Autoscaling (HPA) testen
Terminal 1: k6 run loadtest/k6-express-web.js
Terminal 2: kubectl get hpa -n argocd -w
ggf. export TARGET_IP=$(kubectl get svc express-web -n argocd -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
![alt text](https://github.com/lucabmmr/CloudServ7-project/bilder/HPA_Logging2.png)