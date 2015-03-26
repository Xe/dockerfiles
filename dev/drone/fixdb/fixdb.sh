#!/bin/sh

psql -h $PG_PORT_5432_TCP_ADDR -p $PG_PORT_5432_TCP_PORT -U postgres -c "CREATE DATABASE drone;"
