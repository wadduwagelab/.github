#!/bin/bash
# Usage: bash sync-labels.sh org/repo

if [ -z "$1" ]; then
  echo "Usage: bash sync-labels.sh org/repo"
  exit 1
fi

REPO="$1"

echo "Syncing labels from labels.csv to $REPO..."

# Read labels.csv and create/update labels
tail -n +2 labels.csv | while IFS=, read -r name description color
do
  echo "Processing label: $name"
  gh label create "$name" \
    --description "$description" \
    --color "$color" \
    --repo "$REPO" \
    2>/dev/null || \
  gh label edit "$name" \
    --description "$description" \
    --color "$color" \
    --repo "$REPO"
done

echo "✅ Done syncing labels to $REPO"
