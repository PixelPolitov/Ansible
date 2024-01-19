Примеры запуска playbook-ов
=========

!!!***При первом запуске playbook-а необходимо добавить ключи -u -k
где -u это имя вашего пользователя с правами passwordless sudo, -k запрос пароля для этого пользователя при запуске playbook-а***!!!

- ansible-playbook -i inventories/staging playbooks/install_app.yml -u user -k

1) **Установка кластера из etcd, patroni, vip**

- *ansible-playbook -i inventories/cluster playbooks/etcd.yml*

- *ansible-playbook -i inventories/cluster playbooks/patroni.yml*

2) **Настройка кластера из Docker Swarm**

- *ansible-playbook -i inventories/cluster playbooks/swarm.yml*
