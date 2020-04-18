#!/bin/bash
echo "***********************************************************"
echo `date '+%d-%B-%Y_%H:%M:%S'` "Lancement de la procédure"
echo `date '+%d-%B-%Y_%H:%M:%S'` " - Arrêt du serveur..."
pkill screen
sleep 2
echo `date '+%d-%B-%Y_%H:%M:%S'`" - Redémarrage de mysql..."
sudo service mysql restart
sleep 10
echo `date '+%d-%B-%Y_%H:%M:%S'` " - Nettoyage du cache..."
rm -R /home/dev/server-data/cache/
sleep 2
echo `date '+%d-%B-%Y_%H:%M:%S'` " - Se rendre dans le dossier..."
cd /home/dev/server-data/
sleep 3
echo `date '+%d-%B-%Y_%H:%M:%S'` " - Démarrage du serveur..."
screen -S dev -d -m bash /home/dev/run.sh +exec server.cfg
sleep 5
echo `date '+%d-%B-%Y_%H:%M:%S'` " - Fin de la procédure"
echo "***********************************************************"