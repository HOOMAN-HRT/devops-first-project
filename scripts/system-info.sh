#!/bin/bash

echo "===== System Information ====="
current_date=$(date)
echo "Date: $current_date"
echo ""

echo "Disk Usage:"
df -h /
echo ""

echo "Memory Usage:"
free -h
echo ""

current_user=$(whoami)
echo "User: $current_user"
echo ""

current_host=$(hostname)
echo "Host: $current_host"

disk_usage=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

if [[ "$disk_usage" -ge 80 ]]; then
    echo "WARNING: Disk usage is high: ${disk_usage}%"
else
    echo "Disk usage is normal: ${disk_usage}%"
fi
