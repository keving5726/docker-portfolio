#!/bin/sh
#: Title:	setup-core.sh
#: Date:	2026-07-19
#: Author:	"Kevin González" <keving5726@gmail.com>
#: Version:	1.0
#: Description:	Install and update WordPress core
#: Options:	None

# Exit immediately if a command returns a non-zero status
set -eu

printf "%s\n" "Checking WordPress core status"

# Check if WordPress core is installed
if wp core is-installed 2>/dev/null; then
	printf "%s\n" "WordPress core is already installed"
else
	printf "%s\n" "WordPress core is not installed. Starting default installation"

	WP_ADMIN_PASSWORD=$(cat $WORDPRESS_ADMIN_PASSWORD_FILE)

	wp core install \
		--locale="$WORDPRESS_LOCALE" \
		--url="$WORDPRESS_URL" \
		--title="$WORDPRESS_TITLE" \
		--admin_user="$WORDPRESS_ADMIN_USER" \
		--admin_password="$WP_ADMIN_PASSWORD" \
		--admin_email="$WORDPRESS_ADMIN_EMAIL" \
		--skip-email

	printf "%s\n" "WordPress core successfully installed!"
fi

printf "%s\n" "Checking for pending WordPress core updates"

# Check if an update is available
UPDATE_STATUS=$(wp core check-update --format=count)

# Check for pending updates and apply them
if [ "$UPDATE_STATUS" -gt 0 ]; then
	printf "%s\n" "Upgrading WordPress core"
	wp core update
	wp core update-db
	printf "%s\n" "WordPress core has been successfully updated"
else
	printf "%s\n" "WordPress core is already up to date"
fi
