#!/bin/sh
#: Title:	setup-nginx.sh
#: Date:	2026-07-20
#: Author:	"Kevin González" <keving5726@gmail.com>
#: Version:	1.0
#: Description:	Install and activate the Nginx Helper plugin
#: Options:	None

# Exit immediately if a command returns a non-zero status
set -eu

# Define NGINX Helper JSON configuration payload
CONFIG_FILE="/scripts/nginx-helper-config.json"

# Check if configuration file exists
if [ ! -f "$CONFIG_FILE" ]; then
	printf "%s\n" "Error: Configuration file '$CONFIG_FILE' not found!" >&2
	exit 1
fi

# Install and activate Nginx Helper plugin
if wp plugin is-installed nginx-helper; then
	printf "%s\n" "Ensuring Nginx Helper plugin is active"
	wp plugin activate nginx-helper
else
	printf "%s\n" "Installing and activating Nginx Helper plugin"
	wp plugin install nginx-helper --activate
fi

# Apply Nginx Helper configuration
printf "%s\n" "Configuring Nginx Helper plugin"
wp option update rt_wp_nginx_helper_options --format=json <"$CONFIG_FILE"

# Flush WordPress object cache
printf "%s\n" "Flushing WordPress object cache"
wp cache flush

printf "%s\n" "The Nginx Helper plugin has been installed successfully"
