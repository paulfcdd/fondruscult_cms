#!/usr/bin/env bash
echo '
****************************************
*                                      *
*       Starting system update         *
*                                      *
****************************************
'

echo '1. CHECK REPOSITORY'
git pull

echo '2.INSTALL PHP & JS DEPENDENCIES'
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" &&
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" &&
php composer-setup.php --install-dir=bin &&
php -r "unlink('composer-setup.php');" &&
php bin/composer.phar install &&
cd web/ &&
npm install

echo '2. UPDATING DATABASE'
cd ../ && bin/console doctrine:schema:update --force

echo '3. CLEARING THE CACHE'
bin/console cache:clear --no-warmup &&
bin/console cache:clear --no-warmup --env=prod &&
php -r "unlink('bin/composer.phar');"


echo '
****************************************
*                                      *
*      System update finished!         *
*                                      *
****************************************
'

exit 0;
