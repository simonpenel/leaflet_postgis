FROM rocker/shiny:latest

# Dépendances système utiles
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Packages R nécessaires
RUN R -e "install.packages(c('shiny','leaflet','jsonlite','httr'), repos='https://cloud.r-project.org')"

# Copie de l'application
COPY . /srv/shiny-server/

# Permissions
RUN chown -R shiny:shiny /srv/shiny-server

EXPOSE 3838

CMD ["/usr/bin/shiny-server"]