#!/usr/bin/env bash
set -euo pipefail

REMOTE=${1:-origin}
BRANCH=${2:-main}
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "[force-local] fetching $REMOTE/$BRANCH"
git fetch "$REMOTE" "$BRANCH"

echo "[force-local] ensuring we're on $CURRENT_BRANCH"
git checkout "$CURRENT_BRANCH"

echo "[force-local] merging remote history while keeping local tree"
git merge -s ours "$REMOTE/$BRANCH" -m "force local state over $REMOTE/$BRANCH"

echo "[force-local] pushing local tree over remote $BRANCH"
git push --force-with-lease "$REMOTE" "$CURRENT_BRANCH:$BRANCH"
