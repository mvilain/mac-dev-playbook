#!/usr/bin/env bash
# https://discussions.apple.com/thread/255180158?sortBy=best
# output to temp file

base=$(basename $0)
# TMPFILE=$(mktemp /tmp/${base}.XXXXXX) || exit 1

pgrep WallpaperVideoExtension | xargs kill -9
# https://stackoverflow.com/questions/4210042/how-do-i-exclude-a-directory-when-using-find
sudo find /private/var/folders \
         -type d \( -path "*hh*" -o -path "*zz*" -o -path "*mk*" \) -prune \
         -name "*/extension-com.apple.wallpaper.extension.video/*" \
         > /tmp/${base}.log 2>&1

#rm -f ${TMPFILE}
printf "%s wallpaper video purged\n"  $(date -u +%Y-%m-%dT%H:%M:%SZ)

exit