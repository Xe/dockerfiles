config = require "lapis.config"
config "development", ->
  port 8080

config "docker", ->
  port os.getenv "PORT"
  postgresql_url os.getenv "DATABASE_URL"
