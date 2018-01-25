# HelloWorld

Demo Phoenix app using docker-compose.


## Quick Start

Compile everything and initialize the database:

(note that we have to build first because docker-compose is not honoring `depends_on` for a single service.  this is likely a bug.  see: https://github.com/docker/compose/issues/5608)

```
docker-compose build
docker-compose run web mix ecto.create
```

Start the web server:

```
docker-compose up
```
