#!/bin/bash

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$(dirname "$SCRIPT_DIR")"
BACKUP_DIR="$HOME/backups"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/devops-project-$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

if [[ ! -f "$SOURCE/README.md" || ! -d "$SOURCE/scripts" ]]; then
    echo "ERROR: Project directory is invalid: $SOURCE"
    exit 1
fi

tar -czf "$BACKUP_FILE" \
    --exclude="$(basename "$SOURCE")/.git" \
    -C "$(dirname "$SOURCE")" \
    "$(basename "$SOURCE")"

echo "Backup created successfully:"
echo "$BACKUP_FILE"
