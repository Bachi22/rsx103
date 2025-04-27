# Liste des commandes importante pour ANSIBLE

LIEN DOC : [Lien_DOC_STEPHANE](https://blog.stephane-robert.info/docs/infra-as-code/gestion-de-configuration/ansible/)

## Install ansible

```bash
sudo apt update
sudo apt -y upgrade
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev python3-pip
pip3 install ansible --user
```

## Pour ajouter la clé publique sur la machine cible
- Si first install alors 
```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/ansible_key -N ""
```

- Une fois la clé
```bash
ssh-copy-id -i ~/.ssh/ansible_key.pub USER@IP.IP.IP.IP
```

## Arborescence ansible

```bash
.
├── ansible.cfg
├── files
├── group_vars
│   ├── DMZ.yml
│   ├── exemple.yml
│   ├── vlan_admin.yml
│   └── vlan_interne.yml
├── host_vars
│   ├── VM_DMZ.yml
│   ├── VM_admin.yml
│   ├── VM_interne.yml
│   └── exemple.yml
├── inventory.ini
├── playbooks
└── templates
```

- ansible.cfg : Fichier de configuration d’Ansible. Il permet de personnaliser le comportement d’Ansible, comme le chemin vers l’inventaire, les privilèges de sudo, etc. C’est ici que vous pouvez définir des options globales pour Ansible. Il est optionnel.
- inventory/ : Fichier d’inventaire principal où sont définis les hôtes et leurs groupes. Par exemple, vous y déclarez vos groupes d’hôtes comme webservers, dbservers et les serveurs qui leur sont associés.
- group_vars/ : Ce répertoire contient des fichiers YAML définissant des variables pour des groupes d’hôtes. Chaque fichier porte le nom d’un groupe, ou peut s’appeler all.yml pour des variables globales.
    all.yml : Variables globales appliquées à tous les hôtes.
    webservers.yml : Variables spécifiques au groupe webservers.
- host_vars/ : Ce répertoire contient des fichiers YAML définissant des variables spécifiques à un hôte individuel.
    VM_DMZ.yml : infos machines
- files/ : Répertoire contenant des fichiers à copier directement sur vos hôtes.
- templates/ : Le dossier des templates Jinja
    service.j2 : Un template Jinja de services utilisant des variables et conditions.
- install_apache.yml : Playbook pour installer Apache.
- configure_apache.yml : Playbook pour configurer Apache, en utilisant un template par exemple.

## Exemple de commande 

```bash
ansible-playbook -i inventory.ini playbooks/playbook_test.yml                        # executer le playbook
ansible-playbook -i inventory.ini playbooks/playbook_test.yml -vvv                   # executer le playbook en verbeux
ansible-playbook -i inventory.ini playbooks/playbook_test.yml --check                # simule l'exécution du playbook
ansible-vault create vault.yml                                              # chiffrer un fichier chiffré
ansible-vault encrypt vault.yml                                             # chiffrer un fichier
ansible-playbook -i inventory.ini -l VM_test playbooks/playbook_test.yml    # Utiliser le playbook sur une machine spécifique
```

## ISSUE

Y'a moy qu'il y ait un problème avec la clé écrite en dur mais tqt