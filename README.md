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

A `client/secrets` and `server/secrets` folder with several secret-files is required. Please inquire us directly for details.

You need a DB dump to seed the local DB.

You need to create the SSL-Certificate for `localhost`:

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

We strongly encourage to use *Visual Studio Code* with a couple of plugins that will automatically run linting processes after code changes and keep the code style clean. In the base folder `wirvonhier` create a new file called `wirvonhier.code-workspace` and add the following code to it:

```
{
  "folders": [
    {
      "path": "client"
    },
    {
      "path": "server"
    }
  ],
  "settings": {
    "css.validate": false,
    "less.validate": false,
    "scss.validate": false,
    "eslint.validate": [
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    ],
    "editor.formatOnSave": false,
    "editor.codeActionsOnSave": {
      "source.fixAll.eslint": true,
      "source.fixAll.stylelint": true
    }
  }
}
```

Next open this file inside *Visual Studio Code* (or double click the workspace file) to open the whole workspace and load the linting settings.

Install the following extensions:

- ESLint (version >= 2.1.5)
- stylelint (version >= 0.84.0)
- Vetur (version >= 0.24.0)

Restart *Visual Studio Code* afterwards.

## Deployment

Please run `npm run lint` before pushing any code changes or merges, especially to the branches `development` and `testing` otherwise the build process will fail.




