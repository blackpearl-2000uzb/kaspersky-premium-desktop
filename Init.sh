#!/bin/bash

echo "===== SYSTEM INFO ====="
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "Date: $(date)"
echo

echo "===== INTERNET CHECK ====="
if ping -c 1 google.com &> /dev/null; then
    echo "Internet: OK"
else
    echo "Internet: FAILED"
fi
echo

echo "===== CPU LOAD ====="
uptime
echo

echo "===== MEMORY ====="
free -h
echo

echo "===== DISK ====="
df -h
echo

echo "===== TOP PROCESSES ====="
ps aux --sort=-%mem | head -n 6
echo

BACKUP_DIR="$HOME/backup_test"
SOURCE_DIR="$HOME"

echo "===== BACKUP ====="
mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/backup_$(date +%F).tar.gz" "$SOURCE_DIR" &> /dev/null

echo "Backup created in $BACKUP_DIR"
echo "===== DONE ====="
