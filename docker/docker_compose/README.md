# Docker compose


## Start the docker
sudo docker compose up  --build
docker compose build --no-cache shiny

NOTE sometimes the process may exit with error
failed to solve: process "/bin/sh -c R -e \"pak::pkg_install(c('shiny', 'leaflet','leaflet.extras','jsonlite','httr','shinyjs'))\"" did not complete successfully: exit code: 1
due to 

## Stop the docker
sudo docker compose down

## Fill the database 
sudo docker exec -i arbres-postgis psql -U simon -d chenes < ../docker_postgis/create_table_arbres.sql 

sudo docker exec -i arbres-postgis psql -U simon -d chenes <  ../docker_postgis/fill_table_arbres_suite.sql

## Connect to the databse and remove a table
sudo docker exec -ti arbres-postgis psql -U simon -d chenes
DROP TABLE arbres;

## Log to the container arbres-postgis

sudo docker exec -ti arbres-postgis bash

## Log to the container  containier arbres-shiny eand display the log

sudo docker compose exec shiny bash
ou
sudo docker exec -ti arbres-shiny bash

cat /var/log/shiny-server/*.log
 
## Remove everything
sudo docker system prune -a 
