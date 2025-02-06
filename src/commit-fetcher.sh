#!/bin/bash

REPO_OWNER="suvro47"
REPO_NAME="spring-boot-ecommerce"
GITHUB_API="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/commits"

# Fetch commits from GitHub API
response=$(curl -s $GITHUB_API)

# Extract commit messages and author names using jq
if command -v jq &> /dev/null; then
    echo "$response" | jq -r '.[] | "Author: " + .commit.author.name + "\nMessage: " + .commit.message + "\n------------------------"'
else
    echo "jq is required but not installed. Install it to parse JSON."
fi
