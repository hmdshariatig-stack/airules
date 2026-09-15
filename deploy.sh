#!/bin/bash
# Deployment script to sync airules rules to https://adlr.ir/airules
# This script:
# 1. Stages and commits any pending changes
# 2. Uses the adlr CLI to save the updated content
# 3. Handles the secret code (123789) for authentication
#
# Usage: ./deploy.sh
# Or add to git hooks for automatic deployment

set -e

# Configuration
REPO_DIR="${NGINX_CERTBOT_DIR:-/opt/nginx-certbot}/airules"
AIRULES_SLUG="airules"
AIRULES_SECRET="123789"
AIRULES_FILE="README.md"

# Function to print status
print_status() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Function to handle errors
handle_error() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $1"
    exit 1
}

# Step 1: Ensure the repository is up to date
print_status "Checking repository status..."
cd "$REPO_DIR"

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    handle_error "Not a git repository. Please ensure you're in the airules directory."
fi

# Step 2: Stage and commit any pending changes
print_status "Staging changes..."
git add -A

# Check if there are changes to commit
if git diff --quiet; then
    print_status "No changes to commit. Skipping commit step."
else
    print_status "Committing changes..."
    git commit -m "Deploy airules rules to adlr.ir" || handle_error "Failed to commit changes"
fi

# Step 3: Save to adlr API
print_status "Syncing to adlr.ir..."

# Check if adlr CLI is available
if ! command -v adlr &> /dev/null; then
    handle_error "adlr CLI not found. Please install it first."
fi

# Check if the file exists
if [ ! -f "$AIRULES_FILE" ]; then
    handle_error "File $AIRULES_FILE not found in $REPO_DIR"
fi

# Try adlr update first (requires secret)
print_status "Attempting to update airules content..."
if cat "$AIRULES_FILE" | adlr update "$AIRULES_SLUG" --secret "$AIRULES_SECRET" 2>&1; then
    print_status "Successfully updated airules content!"
elif cat "$AIRULES_FILE" | adlr save "$AIRULES_SLUG" 2>&1; then
    print_status "Successfully saved airules content!"
else
    print_status "Warning: Could not sync to adlr.ir. The server may be unreachable."
    print_status "Local changes are committed. Please try again when network is available."
    print_status "Manual sync command: cat $AIRULES_FILE | adlr update $AIRULES_SLUG --secret $AIRULES_SECRET"
    exit 0
fi

print_status "Deployment complete!"
