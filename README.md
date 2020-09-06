# platformsh-drupal-template

Template based on [drupal/recomended-project](https://github.com/drupal/recommended-project) to create drupal projects to be deployed in [Platformsh](https://platform.sh/), also includes:

- [bloom](https://github.com/ManatiCR/bloom)
- [manati_base_config](https://github.com/ManatiCR/manati-base-config)
- [drush](https://github.com/drush-ops/drush)

## Dependencies

- Docker
- Docker Compose
- [Chirripo Launcher](https://docs.chirripo.dev/chirripo-launcher/)
- [Chirripo Proxy](https://docs.chirripo.dev/chirripo-proxy/)

## Getting Started

### Prepare for local development

This template uses [chirripo](https://docs.chirripo.dev/) as local environment.

Run the local environemnt:

```bash
chirripo start
```

Generate local settings files:

```bash
./scripts/local-settings.sh
```

Install the requiered dependencies:

```bash
composer install
npm install
```

## Installed Stuff

You can change any variable defined in the `.env` file to make adjustments to the provided setup. You can edit the file named `docker-compose.override.yml` in the root of the project to make more advanced customizations.

### Solr

Core is created as `collection1`.

Solr address is `solr`.

Path is `/`.
