#!/bin/sh
#: Title:	clean-assets.sh
#: Date:	2026-07-20
#: Author:	"Kevin González" <keving5726@gmail.com>
#: Version:	1.0
#: Description:	Delete all inactive WordPress plugins and themes
#: Options:	None

# Exit immediately if a command returns a non-zero status
set -eu

# Fetch list of inactive plugins
printf "%s\n" "Fetching list of inactive plugins"
INACTIVE_PLUGINS=$(wp plugin list --status=inactive --field=name)

# Delete inactive WordPress plugins
if [ -n "$INACTIVE_PLUGINS" ]; then
	printf "%s\n" "Deleting inactive WordPress plugins"
	printf "%s\n" "$INACTIVE_PLUGINS" | xargs wp plugin delete
else
	printf "%s\n" "No inactive plugins found"
fi

# Fetch list of inactive themes
printf "%s\n" "Fetching list of inactive themes"
INACTIVE_THEMES=$(wp theme list --status=inactive --field=name)

# Delete inactive WordPress plugins
if [ -n "$INACTIVE_THEMES" ]; then
	printf "%s\n" "Deleting inactive WordPress themes"
	printf "%s\n" "$INACTIVE_THEMES" | xargs wp theme delete
else
	printf "%s\n" "No inactive themes found"
fi

# Flush WordPress object cache
printf "%s\n" "Flushing object cache"
wp cache flush

printf "%s\n" "Cleanup completed successfully"
