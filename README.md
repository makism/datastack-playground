# datastack-playground


## General

A playgound for Apache Spark with Minio support and Delta Lake integration. Additional tools include Airbyte and Lightdash.

## Getting Started

### Building

Run the following command to build the Docker images:
```bash
./build.sh
```

### Running

Now, bring up the cluster with:
```bash
docker-compose up
```

## Extras

### Airbyte

Clone and run the Airbyte repo locally; follow the instructions at https://docs.airbyte.com/deploying-airbyte/local-deployment.

#### CLI

You may need to install the Airbyte CLI. See https://docs.airbyte.com/understanding-airbyte/airbyte-cli and https://github.com/airbytehq/airbyte/blob/master/octavia-cli/README.md

### Lightdash

Clone and run the Lightdash repo locally; follow the instructions at https://docs.lightdash.com/getting-started/quickstart.
