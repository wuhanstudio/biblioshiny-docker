FROM r-base:3.6.3
MAINTAINER wuhanstudio 

RUN apt-get update && apt-get install -y git build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev

COPY . /usr/local/src/myscripts
WORKDIR /usr/local/src/myscripts

RUN git clone https://github.com/wuhanstudio/bibliometrix
RUN tar -cvzf bibliometrix.tar.gz /usr/local/src/myscripts/bibliometrix

RUN Rscript biblioshiny-install.R 
RUN R CMD INSTALL -l "/usr/local/lib/R/site-library/"  /usr/local/src/myscripts/bibliometrix.tar.gz

CMD ["Rscript", "biblioshiny-start.R"]

