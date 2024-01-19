Если вкратце, то в этой репе playbook-и для установки кластера из:

- etcd

- patroni

- haproxy, keepalived (VIP)

- docker swarm

- и можно установить nginx с самоподписанными сертами. 

#### Все это тестировалось на Astra Linux SE 1.7.4 и за работоспособность на других ОС не могу сказать. 

# Полезные команды

### Запуск плейбука с несколькими тэгами:
`ansible-playbook -i inventories/staging playbooks/install_app.yml --tags "tag1,tag2"`


### Переменные окружения:
Использовать свой конфиг настроек:
- ***export ANSIBLE_CONFIG=ansible.cfg***

Переводит stdout в yaml формат:
- ***export ANSIBLE_STDOUT_CALLBACK=yaml***

Ограничение вывода, когда все ОК или пропущено:

- ***export ANSIBLE_DISPLAY_OK_HOSTS=false***

- ***export ANSIBLE_DISPLAY_SKIPPED_HOSTS=false***