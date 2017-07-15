#!/bin/sh

if [ -z "$(ls -A /var/www/html/)" ]; then
	for i in $(ls -A /xe/)
	do
		cp -R /xe/$i /var/www/html
	done

	mkdir /var/www/html/files
	chown -R www-data: /var/www/html/files
fi

rm -rf /xe

exec "$@"
