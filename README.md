# Configuration ELK

La configuration de la stack ELK est entièrement automatisée via Ansible. 
 Ansible est utilisé pour : 

    Installer les prérequis (Docker, Docker Compose, etc.) 

    Déployer et configurer les conteneurs pour Elasticsearch, Logstash, Kibana et le Fleet Server 

    Gérer la configuration des fichiers nécessaires 

Avant le démarrage de la stack, il est nécessaire de modifier le fichier kibana/config/kibana.yml : 

    Remplacer l’adresse IP du Fleet Server / elasticsearch / APM Server par l’adresse IP du serveur hébergeant la stack ELK. 

    Cette modification permet à Kibana de communiquer correctement avec le serveur Fleet pour l'enrôlement des agents Elastic. 

Chaque composant de la stack ELK est conteneurisé. 
 Nous utilisons le projet docker-elk, qui fournit une base légère et extensible pour déployer l'ensemble des services via Docker et Docker Compose. 

La stack est constituée des services suivants : 

    Elasticsearch (port 9200) pour le stockage et l'indexation des données 

    Logstash (port 5044) pour la collecte et le traitement des logs 

    Kibana (port 5601) pour la visualisation et l'interface utilisateur 

    Fleet Server (port 8220) pour la gestion centralisée des agents Elastic 
