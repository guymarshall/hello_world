#!/bin/bash

# Load Cargo.toml file
cargo_toml=$(cat Cargo.toml)

# Get list of dependencies from Cargo.toml
dependencies=$(echo "$cargo_toml" | grep -oP '(?<=\[dependencies\]\n)[\s\S]*')

# Loop through each dependency and get the latest version from crates.io
while read -r crate; do
    crate_name=$(echo "$crate" | cut -d'=' -f1 | xargs)
    crate_version=$(echo "$crate" | cut -d'=' -f2 | xargs)

    latest_version=$(curl -s "https://crates.io/api/v1/crates/$crate_name" | jq -r '.crate.max_version')

    # Replace "*" with latest version
    if [[ $crate_version == "*" ]]; then
        dependencies=$(echo "$dependencies" | sed "s/$crate_name *= *\"*.*\"*/$crate_name = \"$latest_version\"/")
    fi
done <<< "$dependencies"

# Save updated Cargo.toml file
echo "$cargo_toml" | sed "/\[dependencies\]/a $dependencies" > Cargo.toml