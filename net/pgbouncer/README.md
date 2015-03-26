# `docker-pgbouncer`

docker image for pgbouncer

Example usage:
`docker run -i -t -d -p 6432:6432 --link postgres:pg xena/docker-pgbouncer`

This requires a link (named pg) to a postgres container or manually configured 
environment variables as follows:

`PG_PORT_5432_TCP_ADDR` (default: <empty>)

`PG_PORT_5432_TCP_PORT` (default: <empty>)

`PG_ENV_POSTGRESQL_USER` (default: <empty>)

`PG_ENV_POSTGRESQL_PASS` (default: <empty>)

Based on https://github.com/mbentley/dockerfiles/tree/master/ubuntu/pgbouncer
