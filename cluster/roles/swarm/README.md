Имя роли: **swarm**
=========

!!!***Относится к установке кластера***!!!

1) Роль включает режим Docker Swarm

2) Cоздает кворум из трех нод-менеджеров

3) Задает ограничения запуска контейнеров из трех нод только на двух

4) Создает базовый каталог

5) Копирует скрипты для работы с Docker Swarm

6) Создает пользователя rsync на второй ноде, настраивает ssh-keys для синхронизации файлов между 1 и 2 сервером без ввода пароля

Требования
------------
Доступ до целевых хостов, учетная запись с правами sudo,
установленный Docker

Переменные роли
--------------

- `ansible_eth1.ipv4.address` - переменная Ansible для определения ip-адреса сервера
- `created_username` - содержит имя пользователя - rsync


Зависимости
------------
Роли: 

- common


Пример Playbook-а
----------------
--

Автор
------------------
 - PixelPolitov
