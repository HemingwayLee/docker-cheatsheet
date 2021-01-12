# Explain
* When running backend django, the postgres database might not be ready, so we need `init.sh` to do the busy waiting
* With newer version of postgres, we need to set account/pwd/dbname in `docker-compose.yml` file

# Note 
* Django does not the postgres database defined on `docker-compose.yml`

