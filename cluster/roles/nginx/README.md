Имя роли: **nginx**
=========

Роль устанавливает nginx на хост, либо при условии *is_nginx_in_docker: true* копирует докер композ и пулит образ nginx. Создает сим. линки сертификатов в каталог ssl

- /etc/nginx по умолчанию каталог установки, если хост
- /opt/nginx по умолчанию каталог установки, если докер

Требования
------------
Доступ до целевых хостов и учетная запись с правами sudo

Переменные роли
--------------

- `is_nginx_in_docker`: true или false, если false то установка nginx на хосте
- `nginx_dir` - каталог установки
- `nginx_image` - имя докер образа
- `nginx_container_name` - имя докер контейнера
- `nginx_http_port_app` - http порт asu|zvk
- `nginx_tcp_port_app` - tcp порт из Zvk.ini
- `nginx_https_port_app` - https порт asu|zvk
- `nginx_https_port_netA` - порт сервера авторизации ZRP.NET
- `nginx_https_port_netB` - порт бэкенд сервера ZRP.NET
- `nginx_https_port_netC` - https порт веб-конфигуратора ZRP.NET
- `nginx_http_port_netC` - http порт веб-конфигуратора
- `nginx_server_name` - имя сайта



Зависимости
------------
Роли:
 
- certs


Пример Playbook-а
----------------
--

Автор
------------------
 - PixelPolitov
