# WirVonHier App

## Prerequisites

- mkcert [Get mkcert](https://github.com/FiloSottile/mkcert)
- GIT [Get GIT](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- Docker [Get Docker](https://docs.docker.com/get-docker/)
- Docker-Compose [Get Docker Compose](https://docs.docker.com/compose/install/)

## Installation

Clone this repository:

`git clone https://github.com/wirvonhier/wirvonhier-base.git wirvonhier.net && cd wirvonhier.net`

Create the project with:

- Linux / MacOS: `make wirvonhier`
- Windows: `nmake -f Makefile.win`

A `client/secrets`, `server/secrets`, `mongo/secrets` folder with several secret-files is required. Please inquire us directly for details.

By default the DB is initiated without data.

You prevent a browser security warning you need to create your own SSL-Certificate for `localhost`:

`mkcert -install && mkcert -cert-file proxy/localcerts/localhost.pem -key-file proxy/localcerts/localhost-key.pem localhost`

Finally, run `docker-compose up`

## Start

To start the app in development mode, run the following command:

`docker-compose up`

This starts all required services.

Client: [localhost](https://localhost)

Server: `localhost/server` (HealthCheck: [localhost/health](localhost/health))

Mongo-Express: [0.0.0.0:8081](http://0.0.0.0:8081)

To shutdown: `ctrl + c`

To clean-up: `docker-compose down`

## Development

We strongly encourage to use *Visual Studio Code* with a couple of plugins that will automatically run linting processes after code changes and keep the code style clean.

Install the following extensions:

- Debugger for Chrome (verion >= 4.12.9)
- ESLint (version >= 2.1.5)
- stylelint (version >= 0.84.0)
- Vetur (version >= 0.24.0)

Restart *Visual Studio Code* afterwards.

## Deployment

### Deploy to test.wirvonhier.net

For each Sub-Module (`client`, `server`, `proxy`, `mongo`) you need to complete the following steps:

1. Merge your changes to branch `test` (`git checkout test && git merge <YOUR_FEATURE_BRANCH>`).
2. Push branch test to github `git push`.

This creates a new Docker-Image in our Docker-Hub Repository ([https://hub.docker.com/repository/docker/wirvonhier](https://hub.docker.com/repository/docker/wirvonhier))

3. Find the newly created docker image (Repository: `wirvonhier/<SUB_MODULE>`, Tag: `test-<TIMESTAMP>` - it will be the most recently created image).
4. Checkout the `test` branch of the base repository (Folder `wirvonhier.net`).
5. Replace the `tag` of the updated Sub-Module within `docker-compose.test.yml` with the tag of your newly created image (e.g. LINE `image: wirvonhier/proxy:test-12949881929`).
6. Push the branch got github `git push`.

This will automaticall deploy the updated images on [test.wirvonhier.net](https://test.wirvonhier.net)
