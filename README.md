# Grafana dashboard maker

Simple bash script to generate environment-specific Grafana dashboard templates. Making it possible to easily setup a Grafana dashboard for a customer.

## Quick Start

```bash
./generate.sh
```

The script will ask you to:
1. Enter a namespace (e.g., `my-app`, `production`, etc.)
2. Select a cluster (development or production)

It then generates customized dashboard JSON files in `./out/<namespace>/`

## What It Does

- Takes JSON dashboard templates from `./templates/`
- Replaces the placeholders with your values
- Saves the customized dashboards to `./out/<namespace>/`

## Templates Included

- Overview.json
- Logs.json
- Postgres.json
- GeoServer.json
- MapGallery.json

## Importing to Grafana

1. Go to Dashboards → Import
2. Upload or paste the JSON from the generated files
3. Configure data sources as needed

## Adding New Templates

Just add a new JSON file to `./templates/` with `replaceme-namespace` and `replaceme-cluster` placeholders. The script will automatically process it.