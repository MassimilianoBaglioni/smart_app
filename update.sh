#!/bin/bash

# Make sure you're in the root of your integration repo
# cd /path/to/integration-repo

# Loop through all submodules
for submodule in $(git submodule foreach 'echo $name'); do
    echo "Updating submodule $submodule..."

    # Fetch the latest changes for the submodule
    git submodule update --remote submodules/$submodule

    # Stage the updated submodule reference
    git add submodules/$submodule

    # Commit the changes (if any)
    git commit -m "Update submodule $submodule to the latest commit"

done

git push origin master 
