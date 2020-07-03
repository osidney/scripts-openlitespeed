#!/bin/sh
echo "OLS OpenLiteSpeed Updater por Cloud Rocket - 0.1"
mydate=$(date +"%F-%H-%M")
if [ "$( curl -s 'https://openlitespeed.org/packages/release' )" != "$( cat '/usr/local/lsws/VERSION' )" ]
then
        echo "----------------------------"
        echo "Openlitespeed possui uma atualização de versão disponível."
        echo $( curl -s 'https://openlitespeed.org/packages/release' )
        echo "----------------------------"
else
        echo "----------------------------"
        echo "Openlitespeed está atualizado."
        echo "----------------------------"
fi
newversion=$( curl -s 'https://openlitespeed.org/packages/release' )
cp -pr /usr/local/lsws/ /usr/local/lsws-$mydate
wget https://openlitespeed.org/packages/openlitespeed-$newversion.tgz
tar zxvf openlitespeed-$newversion.tgz
cd openlitespeed
./configure --prefix=/usr/local/lsws
./install.sh
