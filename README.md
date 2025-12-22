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




