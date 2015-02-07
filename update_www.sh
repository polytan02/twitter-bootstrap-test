#!/bin/bash

#!/bin/bash

# Setup of colours for error codes
set -e;
txtgrn=$(tput setaf 2);    # Green
txtred=$(tput setaf 1);    # Red
txtcyn=$(tput setaf 6);    # Cyan
txtpur=$(tput setaf 5);    # Purple
txtrst=$(tput sgr0);       # Text reset
failed=[${txtred}FAILED${txtrst}];
ok=[${txtgrn}OK${txtrst}];
info=[${txtcyn}INFO${txtrst}];
script=[${txtpur}SCRIPT${txtrst}];

myuser=$(whoami);
sources=/home/$myuser/git/twitter-bootstrap-test/bootstrap;
dest=/var/www/webapp_maxtest/site;

echo -e "\n$script Copie des fichiers vers www/site \n";

read -e -p "git pull avant copie ? (yn) : " -i "y" s1;
if [ $s1 == 'y' ];
        then echo -e "\n"; git pull
        echo -e "\n$ok git pull terminé...\n";
        else echo -e "\nOk, on ne fait rien\n";
        read -e -p "Presser \" entrée \"...  ";
fi;



echo -e "$ok Dossier sources : $sources";
echo -e "$ok Dossier destination : $dest\n";

read -e -p "On copie les fichiers ? ? (yn) : " -i "y" s1;
if [ $s1 == 'y' ];
        then sudo rm -rf $dest/*;
        sudo cp -av $sources/* $dest/;
        sudo chown -vR maxbilh:www-data $dest;
        echo -e "\n$ok Copie terminée...\n";
        else echo -e "\nOk, on ne fait rien\n";
        read -e -p "Presser \" entrée \"...  ";
fi;

