FROM rocker/shiny:latest

# Dépendances système utiles
RUN apt-get update && apt-get install -y \
    libudunits2-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Packages R nécessaires
#RUN R -e "install.packages(c('shiny','leaflet','jsonlite','httr'), repos='https://cloud.r-project.org')"

 RUN R -e "install.packages('pak', repos='https://cloud.r-project.org')"
 RUN R -e "pak::pkg_install(c('shiny', 'leaflet','leaflet.extras','jsonlite','httr','shinyjs'))"
# Copie de l'application
COPY . /srv/shiny-server/

# Permissions
RUN chown -R shiny:shiny /srv/shiny-server

EXPOSE 3838

CMD ["/usr/bin/shiny-server"]