#!/bin/sh

# Перед запуском скрипта скачайте пакет jq: sudo apt install jq
# Впишите свои значения для переменных
IP="192.168.242.11"
CLUSTER_NAME="cluster-pgsql"
PATRONI_PATH="/etc/patroni/postgres.yml"

# DB Version: 14
# OS Type: linux
# DB Type: mixed
# Total Memory (RAM): 12 GB
# CPUs num: 4
# Connections num: 300
# Data Storage: ssd
MIN_CONF='{
  "max_connections": "300",
  "shared_buffers": "3GB",
  "effective_cache_size": "9GB",
  "maintenance_work_mem": "768MB",
  "checkpoint_completion_target": "0.9",
  "wal_buffers": "16MB",
  "default_statistics_target": "100",
  "random_page_cost": "1.1",
  "effective_io_concurrency": "200",
  "work_mem": "2621kB",
  "huge_pages": "off",
  "min_wal_size": "1GB",
  "max_wal_size": "4GB",
  "max_worker_processes": "4",
  "max_parallel_workers_per_gather": "2",
  "max_parallel_workers": "4",
  "max_parallel_maintenance_workers": "2"
}'

# DB Version: 14
# OS Type: linux
# DB Type: web
# Total Memory (RAM): 32 GB
# CPUs num: 18
# Connections num: 1000
# Data Storage: ssd
MAX_CONF='{
  "max_connections": "1000",
  "shared_buffers": "8GB",
  "effective_cache_size": "24GB",
  "maintenance_work_mem": "4GB",
  "checkpoint_completion_target": "0.9",
  "wal_buffers": "16MB",
  "default_statistics_target": "100",
  "random_page_cost": "1.1",
  "effective_io_concurrency": "200",
  "work_mem": "20MB",
  "huge_pages": "try",
  "min_wal_size": "1GB",
  "max_wal_size": "4GB",
  "max_parallel_workers_per_gather": "4",
  "max_parallel_maintenance_workers": "4",
  "max_worker_processes": "12",
  "max_parallel_workers": "12"
}'

echo -e "\e[32mВыберите по каким характеристикам прокачать СУБД:\e[0m"

options=("По минимальным" "По максимальным" "Выйти")
select opt in "${options[@]}"
do
    case $opt in
        "По минимальным")
            curl -s -XPATCH -u patroni:patroni -d "{\"postgresql\":{\"parameters\":$MIN_CONF}}" http://$IP:8008/config | jq .
            sudo patronictl -c $PATRONI_PATH restart $CLUSTER_NAME
            break
            ;;

        "По максимальным")
            curl -s -XPATCH -u patroni:patroni -d "{\"postgresql\":{\"parameters\":$MAX_CONF}}" http://$IP:8008/config | jq .
            sudo patronictl -c $PATRONI_PATH restart $CLUSTER_NAME
            break
            ;;

        "Выйти")
            break
            ;;
        *) echo "Неверный выбор";;
    esac
done

