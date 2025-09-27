#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

usage(){
	echo "Usage: $0 -d destination source.."
	echo " -d destination Where to save the backup"
	echo " -h Show this help msg"
}


if [[ "${1:-}" == "-h" ]]
then
	usage
	exit 0
fi

DEST=""
SOURCES=()
while [[ $# -gt 0 ]]
do
	case "$1" in
	 -d)
	    DEST="$2"
   	    shift 2
	    ;;
	 -h)
            usage 
            exit 0
            ;;
          *) 
           SOURCES+=("$1")
           shift 
           ;;
         esac
done 
    
if [[ -z "$DEST" ]]
then
	echo "Error : destination folder (-d) is required"
	usage
	exit 1
fi

if [[ ${#SOURCES[@]} -eq 0 ]]
then
    echo "Error: At least one source path is required."
    usage
    exit 1
fi

echo "Destination folder: $DEST"
echo "Source paths:"
for s in "${SOURCES[@]}"; do
    echo "  $s"
done

# --- Create timestamped backup folder ---
TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_FOLDER="$DEST/backup_$TIMESTAMP"

mkdir -p "$BACKUP_FOLDER"

echo "Backup folder created: $BACKUP_FOLDER"

# --- Copy each source file to the backup folder ---
for f in "${SOURCES[@]}"; do
    if [[ -f "$f" ]]; then
        cp "$f" "$BACKUP_FOLDER/"
        echo "Copied $f → $BACKUP_FOLDER/"
    else
        echo "Warning: $f does not exist, skipping."
    fi
done
# --- Compress the backup folder ---
ARCHIVE="$DEST/backup_$TIMESTAMP.tar.gz"

tar -czf "$ARCHIVE" -C "$DEST" "backup_$TIMESTAMP"

echo "Backup compressed to: $ARCHIVE"


