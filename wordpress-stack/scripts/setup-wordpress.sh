#!/bin/sh
#: Title:	setup-wordpress.sh
#: Date:	2026-07-21
#: Author:	"Kevin González" <keving5726@gmail.com>
#: Version:	1.0
#: Description:	Run scripts to install, update and configure WordPress
#: Options:	None

# Exit immediately if a command returns a non-zero status
set -eu

printf "%s\n" "Starting WordPress core install/update"
/scripts/setup-core.sh

printf "%s\n" "Setting up Redis Object Cache plugin"
/scripts/setup-redis.sh

printf "%s\n" "Configuring Nginx Helper plugin"
/scripts/setup-nginx.sh

printf "%s\n" "Cleaning up assets"
/scripts/clean-assets.sh

printf "%s\n" "Done! All WP-CLI tasks completed successfully"
