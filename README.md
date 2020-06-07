# wagtail

Wagtail is a Content Management System that is served from a Django backend API server. 

This is my setup to run wagtail locally.

Changes are to be made to set this up as a development environment.

## Prerequisites

1. git
2. docker
3. docker-compose

## Build and start the local Wagtail server

Currently to run Wagtail server locally:

```
# Build the Wagtail docker image, and copy the modified settings.py and the init script

docker build -t wagtail:development-0.1 .

# Orchestrate the Postgres container (for DB backend) and the Wagtail container through docker-compose
# TODO: replace with Kubernetes orchestration

docker-compose up -d
```

Access the local instance of Wagtail at `http://localhost:9000`.