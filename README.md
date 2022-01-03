# Magento 2 Docker Compose Environment

## Installation
### Homebrew (MacOs/Linux/Windows)
Install Homebrew by following guide https://docs.brew.sh/Installation


### Formula
Just install by the command
```bash
brew install digitalspacestdio/docker-compose-magento/docker-compose-magento
```

## Usage
Export your composer auth tokens
If you use github only
```bash
export COMPOSE_PROJECT_COMPOSER_AUTH='{
    "http-basic": {
        "repo.magento.com": {
            "username": "xxxxxxxxxxxx",
            "password": "yyyyyyyyyyyy"
        }
    },
    "github-oauth": {
        "github.com": "xxxxxxxxxxxx"
    }
}'
````

To use specific php version just export environment variable:
```bash
export COMPOSE_PROJECT_PHP_VERSION=7.4
```
> following versions are supported: 7.2, 7.3, 7.4, 8.0

Create the new project or navigate to exists
```bash
mkdir ~/magento2 && cd ~/magento2
docker-compose-magento run --rm cli composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=^2 /var/www
```

Install dependencies (if needed)
```bash
docker-compose-magento run --rm cli composer install -o --no-interaction
```

Deploy sample data (if needed)
```bash
docker-compose-magento run --rm cli bin/magento sampledata:deploy
```

Install the application
```bash
docker-compose-magento run --rm cli bin/magento setup:install --backend-frontname="admin" --key="admin" --session-save="files" --db-host="database:3306" --db-name="magento2" --db-user="magento2" --db-password="magento2" --base-url="http://localhost:30280/" --base-url-secure="https://localhost:30280/" --admin-user="admin" --admin-password='$ecretPassw0rd' --admin-email="johndoe@example.com" --admin-firstname="John" --admin-lastname="Doe" --key="26765209cb05b93729898c892d18a8dd" --search-engine=elasticsearch7  --elasticsearch-host=elasticsearch --elasticsearch-port=9200
```

Disable 2FA module (if needed)
```bash
docker-compose-magento run --rm cli bin/magento module:disable Magento_TwoFactorAuth
```

Disable FPC
```bash
docker-compose-magento run --rm cli bin/magento cache:disable full_page
```

Start the stack in the background mode
```bash
docker-compose-oroplatform up -d
```

Start the stack in the foreground mode
```bash
docker-compose-oroplatform up
```
> Application will be available by following link: http://localhost:30280/

Stop the stack
```bash
docker-compose-magento down
```

Destroy the whole data
```bash
docker-compose-magento down -v
```

## Supported Environment Variables
* `COMPOSE_PROJECT_MODE` - (`mutagen`|`default`)
* `COMPOSE_PROJECT_PHP_VERSION` - (`7.1`|`7.2`|`7.3`|`7.4`|`8.0`)
* `COMPOSE_PROJECT_NAME` - by default the project directory will be used
* `COMPOSE_PROJECT_PORT_PREFIX` - `302` by default
* `COMPOSE_PROJECT_PORT_HTTP` - `$COMPOSE_PROJECT_PORT_PREFIX` + `80` by default
* `COMPOSE_PROJECT_PORT_XHGUI` - `$COMPOSE_PROJECT_PORT_PREFIX` + `81` by default
* `COMPOSE_PROJECT_PORT_MYSQL` - `$COMPOSE_PROJECT_PORT_PREFIX` + `06` by default
* `COMPOSE_PROJECT_PORT_ELASTICSEARCH` - `$COMPOSE_PROJECT_PORT_PREFIX` + `92` by default
* `COMPOSE_PROJECT_PORT_MAIL_WEBGUI` - `$COMPOSE_PROJECT_PORT_PREFIX` + `25` by default
