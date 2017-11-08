echo '
****************************************
*                                      *
*       Starting system updating       *
*                                      *
****************************************
'

echo '1. CHECK REPOSITORY'
git pull

echo '2. UPDATING DATABASE'
bin/console doctrine:schema:update --force

echo '3. CLEARING THE CACHE'
bin/console cache:clear --no-warmup
bin/console cache:clear --no-warmup  --env=prod

echo '
****************************************
*                                      *
*     System updating finished!        *
*                                      *
****************************************
'

exit 0;
