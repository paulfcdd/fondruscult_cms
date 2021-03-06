#!/usr/bin/env bash
echo '
****************************************
*                                      *
* Welcome tho the installation process *
*                                      *
****************************************
'

echo '1. INSTALL COMPOSER'
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" &&
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" &&
php composer-setup.php --install-dir=bin &&
php -r "unlink('composer-setup.php');"

echo '2.INSTALL PHP & JS DEPENDENCIES'
php bin/composer.phar install && cd web/ && npm install

#echo '3. CREATING DATABASE'
#cd ../ && php bin/console doctrine:database:create

#echo "4. IMPORT DATABASE SCHEME"
#php bin/console doctrine:schema:update --force

#echo "4. IMPORT DATABASE?"
#select choice in "Yes" "No" "Skip"; do
#    case $choice in
#        Yes ) 	echo 'Importing database' &&
#				php bin/console doctrine:database:import bin/dump.sql; break;;
#
#        No ) 	echo 'Creating database schema' &&
#				php bin/console doctrine:schema:update --force &&
#				echo 'Creating an admin user'
#				php bin/console fos:user:create --super-admin; break;;
#
#	    Skip ) break;;
#    esac
#done

#echo '5. CREATING ADMIN USER'
#php bin/console fos:user:create --super-admin;

echo " 5. CLEARING THE CACHE AND REMOVING TMP FILES"
php bin/console cache:clear --no-warmup && php bin/console cache:clear --no-warmup --env=prod && php -r "unlink('bin/composer.phar');"

echo '
****************************************
*                                      *
*    Installation process complete     *
*                                      *
****************************************
'
exit 0;
