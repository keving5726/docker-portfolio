#!/bin/sh
#: Title:	setup-redis.sh
#: Date:	2026-07-20
#: Author:	"Kevin González" <keving5726@gmail.com>
#: Version:	1.1
#: Description:	Install and activate the Redis Object Cache plugin
#: Options:	None

# Exit immediately if a command returns a non-zero status
set -eu

# Install and activate Redis Object Cache plugin
if wp plugin is-installed redis-cache; then
	printf "%s\n" "Ensuring Redis Object Cache plugin is active"
	wp plugin activate redis-cache
else
	printf "%s\n" "Installing and activating Redis Object Cache plugin"
	wp plugin install redis-cache --activate
fi

printf "%s\n" "Enable the object cache drop-in"
wp redis enable

printf "%s\n" "The Redis Object Cache plugin has been installed successfully"
