FROM r-base:3.6.3
MAINTAINER wuhanstudio 

RUN apt-get update && apt-get install -y build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev

COPY . /usr/local/src/myscripts
WORKDIR /usr/local/src/myscripts


RUN Rscript biblioshiny-install.R 
RUN R CMD INSTALL -l "/usr/local/lib/R/site-library/"  /usr/local/src/myscripts/bibliometrix-master.zip

CMD ["Rscript", "biblioshiny-start.R"]

