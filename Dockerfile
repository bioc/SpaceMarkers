#generated from 5e8ce2188e8157bfd86d5eb614499004cc4a5b65
# --platform=linux/amd64 to avoid 'no match for platform in the manifest' on M1
FROM rocker/tidyverse:4

COPY . /spacemarkers
WORKDIR /spacemarkers

RUN sudo apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install libhdf5-dev build-essential patch -y

RUN Rscript -e 'devtools::install_deps()'

#https://github.com/r-lib/devtools/issues/2395
RUN Rscript -e 'devtools::install()'

#optoional packages - for vizualization
RUN Rscript -e 'install.packages("patchwork");\
                install.packages("ggplot2");\
                install.packages("dplyr");\
                install.packages("DT");\
                install.packages("Matrix");\
                install.packages("jsonlite");\
                install.packages("pheatmap");\
                install.packages("RColorBrewer")'