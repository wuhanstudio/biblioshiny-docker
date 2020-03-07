FROM r-base:3.6.3
MAINTAINER wuhanstudio 

COPY biblioshiny-install.R biblioshiny-install.R
COPY biblioshiny-start.R biblioshiny-start.R

RUN Rscript biblioshiny-install.R 
CMD Rscript biblioshiny-start.R

