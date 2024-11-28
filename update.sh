#!/bin/bash

# Ensure the script is being run from the root of your integration repository
if [ ! -f ".gitmodules" ]; then
  echo "This script must be run from the root of the integration repository."
  exit 1
fi

# Fetch the latest changes from the submodules and update the commit reference in the main repo
echo "Updating submodules..."

# Step 1: Initialize and update submodules if not already initialized
git submodule update --init --recursive

# Step 2: Fetch the latest changes from the remote for each submodule
git submodule update --remote --merge

# Step 3: For each submodule, update the reference in the main repo
# This will update the submodule reference (to the latest commit in the remote repository)
git submodule foreach 'git fetch origin && git checkout $(git rev-parse --abbrev-ref origin/$(git rev-parse --abbrev-ref HEAD))'

# Step 4: Stage the changes in the main repository (submodule commit updates)
git add .

# Step 5: Commit the changes (updated submodule references)
git commit -m "Update submodules to the latest commits"

# Step 6: Push the changes to the main repository
git push origin $(git rev-parse --abbrev-ref HEAD)

echo "Submodules updated and changes pushed to the integration repository."

