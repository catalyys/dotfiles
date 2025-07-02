#!/bin/sh

# Ensure .themes exists
mkdir -p ~/.themes

# Extract all .zip files in .themes
find ~/.themes -name "*.zip" -exec sh -c 'unzip -o -d "$(dirname "{}")" "{}" && rm -f "{}"' \;

