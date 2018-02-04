#!/bin/sh

# This script pretends to be youtube-dl. It actually does nothing
# except print fake output on a delay.

set -e

nsteps=80
size=100.0
rate=2.75
dbfile="$(dirname "$0")/../simulation.db"

while [ -- != "$1" ]; do
    shift
done
shift
id="$1"

# Persist download state across runs
put() {
    if grep -q -- "$id" "$dbfile" 2>/dev/null; then
        sed -i.tmp "s/^$id.*/$id $1/" "$dbfile"
        rm -f "$dbfile.tmp"
    else
        printf "%s %s\n" "$id" "$1" >> "$dbfile"
    fi
}
get () {
    if grep -q -- "$id" "$dbfile" 2>/dev/null; then
        awk "/^$id/{print \$2}" "$dbfile"
    else
        echo 0
    fi
}

printf '[youtube] %s: Downloading webpage\n' "$id"
printf '[youtube] %s: Downloading video info webpage\n' "$id"
printf '[youtube] %s: Extracting video information\n' "$id"
printf '[download] Destination: %s\n' "$id.mp4"
for i in $(seq $(get "$id") $((nsteps - 1))); do
    printf '[download] % 5.1f%% of % 2.2fMiB at % 2.2fMiB/s ETA %02d:%02d\n' \
           $((i * 100 / (nsteps - 1))) $size $rate \
           $(((nsteps - i - 1) / 60)) $(((nsteps - i - 1) % 60))
    put $i
    sleep 0.1
done
