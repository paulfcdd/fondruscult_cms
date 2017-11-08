echo '
****************************************
*                                      *
* Welcome tho the installation process *
*                                      *
****************************************
'

echo '1. CHECKING FOR THE NEWEST VERSION OF COMPOSER'
php bin/composer.phar self-update

echo '2.INSTALLING DEPENDENCIES'
php bin/composer.phar install

echo '3. CREATING DATABASE'
php bin/console doctrine:database:create

echo "4. IMPORT DATABASE SCHEME"
php bin/console doctrine:schema:update --force

echo '5. CREATING ADMIN USER'
php bin/console fos:user:create --super-admin;

echo " 5. CLEARING THE CACHE"
php bin/console cache:clear --no-warmup && php bin/console cache:clear --no-warmup --env=prod

echo '
****************************************
*                                      *
* Installation process complete        *
*                                      *
****************************************
'
exit 0;
