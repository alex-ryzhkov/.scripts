#!/usr/bin/sh

rss_item=$(sqlite3 ~/.newsboat/cache.db 'select title, feedurl from rss_item
where unread=1 order by pubDate desc limit 1;' | awk '{split($0,a,"|"); print a[1];
printf("\n"); print a[2]}')
title=$(echo "$rss_item" | head -1)
url=$(echo "$rss_item" | tail -1)
notify-send "$title" "$url"
exit $?
