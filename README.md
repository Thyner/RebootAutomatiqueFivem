# RebootAutomatiqueFivem
Ce script va permettre de redémarrer votre serveur fivem a des horaires définit dans un crontab .


Tester et Approuver sur un VPS avec la distribution Debian 8 en 2020.

Mettre le script "reload_fxserver.sh dans la racine de votre user soit /home/nom_de_votre_user.

Rendre le script exécutable avec la commande suivante : chmod +x reload_fxserver.sh

Pour ajouter des horaires à 12H et 18H, il faut aller sur votre terminal et vous connecter avec votre user et SURTOUT PAS EN ROOT (dans mon exemple "dev").
cela va vous afficher " dev@localhost:~$ " et taper la commande 'crontab -e'

Et rentre, ces lignes suivantes en pensant bien a enlever l'espace entre les deux lignes :

00 12 * * * /home/dev/reload_fxserver.sh >> /var/log/fxreload/fxreloadlog

00 18 * * * /home/dev/reload_fxserver.sh >> /var/log/fxreload/fxreloadlog

Pensez bien a modifier le  /home/dev par votre nom de votre user.
Puis une fois fait faite un CONTROLE + X puis la touche Y pour validé puis ENTRER.

Pour vérifier l'enregistrement : rentrer la commande 'crontab -l'.

Et la tout sera bon, votre serveur fera un reboot de votre serveur fivem tous les jours a 12H et 18H

Pour avoir des logs je vous laisse regarde ce tuto:
https://github.com/ESX-PUBLIC/Auto_Restart_Fivem_Server

Quand j'ai suivi le tuto avec le lien mis plus haut, j'ai eu quelques soucis
j'ai donc fait un script un peut modifier par rapport à celui d'origine.

Un tuto vidéo et en français a était mis en place pour ceux qui préfère voir en réel ce qui se passe.


Création du journal de log


En Root, cette fois, entrer les commandes suivantes qui permettront de créer un fichier de log, mettre les droits, paramétrer les logs.


Commencer par celle-ci :

mkdir /var/log/fxreload


Puis celle-ci :


chown -R dev:dev /var/log/fxreload/ (ici modifier le user dev par votre user)
vi /etc/logrotate.d/fxreload


Ajouter dans le fichier fxreload :

/var/log/fxreload/fxreloadlog
{
        rotate 4
        weekly
        missingok
        notifyempty
        delaycompress
        compress
}


Pour vérifier que tout soit bien sauvegarde taper cette commande :' cat /etc/logrotate.d/fxreload'

Pour finir, attendez 12h ou 18h que le serveur redémarre bien, et allez dans les logs pour effectuer une première vérification.

Allez sur votre gestionnaire de fichier (généralement FileZila) et rentrer ceci :  /var/log/fxreload


Si vous avez pas tout compris pour les logs voici le tuto d'origine.
https://github.com/ESX-PUBLIC/Auto_Restart_Fivem_Server
