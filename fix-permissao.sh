#!/bin/sh
echo "OLS Correção de permissões - 0.1"
echo "Nome do domínio (sem www):"
read DOMAIN
HOMEDIR="/home/$DOMAIN/public_html"

USERNAME=`stat -c "%U" $HOMEDIR/`
sudo chown -R $USERNAME.$USERNAME $HOMEDIR
sudo find $HOMEDIR/ -type f -exec chmod 664 {} \; && sudo find $HOMEDIR/ -type d -exec chmod 775 {} \;
echo "Problema de permissão corrigido"
