#!/bin/sh
#: Title:	setup-redis.sh
#: Date:	2026-06-13
#: Author:	"Kevin González" <keving5726@gmail.com>
#: Version:	1.0
#: Description:	Install and activate the Redis Object Cache plugin
#: Options:	None

# Exit immediately if a command returns a non-zero status
set -e

# Wait until WordPress is fully installed and database is ready
until wp core is-installed --allow-root
do
	printf "%s\n" "Waiting for WordPress installation to complete"
	sleep 5
done

# Install and activate Redis Object Cache plugin
if wp plugin is-installed redis-cache --allow-root
then
	printf "%s\n" "Ensuring Redis Object Cache plugin is active"
	wp plugin activate redis-cache --allow-root
else
	printf "%s\n" "Installing and activating Redis Object Cache plugin"
	wp plugin install redis-cache --activate --allow-root
fi

printf "%s\n" "Enable the object cache drop-in"
wp redis enable --allow-root

printf "%s\n" "The Redis Object Cache plugin has been installed successfully"
