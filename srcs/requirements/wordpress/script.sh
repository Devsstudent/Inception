config=/var/html/www/odessein.42.fr/wp-config.php

sleep 10

if [ ! -f $config ] ;
then
  echo $SQL_DATABASE ahsdh
  wp config create        --allow-root \
  --dbname=$SQL_DATABASE \
  --dbuser=$SQL_USER \
  --dbpass=$SQL_PASSWORD \
  --dbhost=mariadb:3306 --path='/var/html/www/odessein.42.fr/'
  cat /var/html/www/odessein.42.fr/wp-config.php
fi

wp core install --allow-root --url=odessein.42.fr --title=Inception --admin_user=odessein --admin_password=$WP_PASSWORD --admin_email=odessein@student.42.fr --path='/var/html/www/odessein.42.fr'
wp user create --allow-root basic_user basic_user@student.42.fr --role=contributor --path='/var/html/www/odessein.42.fr'

chown -R 640 /var/html/www/odessein.42.fr/wp-config.php
chown -R www-data:www-data /var/html/www/odessein.42.fr/wp-config.php

/usr/sbin/php-fpm7.4 -F -R
