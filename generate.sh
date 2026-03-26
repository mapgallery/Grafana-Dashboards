#!/bin/bash

namespace=""
cluster=""

while [[ -z "$namespace" ]]; do
    read -p "Enter namespace: " namespace
    if [[ -z "$namespace" ]]; then
        echo "Error: Namespace cannot be empty"
    fi
done

while [[ -z "$cluster" ]]; do
    echo ""
    echo "Select cluster:"
    select choice in "development" "production"; do
        if [[ -n "$choice" ]]; then
            cluster="$choice"
            break
        else
            echo "Invalid selection"
        fi
    done
done

echo ""
echo "========================================="
echo "Namespace: $namespace"
echo "Cluster:   $cluster"
echo "========================================="
echo ""

output_dir="./out/$namespace"
if [[ ! -d "$output_dir" ]]; then
    echo "Creating output directory: $output_dir"
    mkdir -p "$output_dir"
fi

echo "Processing templates..."
for template_file in ./templates/*.json; do
    if [[ -f "$template_file" ]]; then
        filename=$(basename "$template_file")
        output_file="$output_dir/$filename"
        sed "s/replaceme-namespace/$namespace/g; s/replaceme-cluster/$cluster/g" "$template_file" > "$output_file"
        echo "  ✓ $filename"
    fi
done

echo ""
echo "Processed files written to: $output_dir"
