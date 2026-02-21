#!/bin/bash

# Пути
SCRIPT_NAME="set_dns.py"
SERVICE_NAME="set-dns.service"
DEST_SCRIPT="/usr/local/bin/set_dns.py"
DEST_SERVICE="/etc/systemd/system/set-dns.service"

echo "--- DNS Fixer Installer ---"

if [ "$EUID" -ne 0 ]; then 
  echo "Ошибка, запустите install.sh через sudo"
  exit
fi

cp $SCRIPT_NAME $DEST_SCRIPT
chmod +x $DEST_SCRIPT
cp $SERVICE_NAME $DEST_SERVICE

systemctl daemon-reload
systemctl enable $SERVICE_NAME
systemctl start $SERVICE_NAME

echo "--- Установка завершена! ---"

