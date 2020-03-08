FROM r-base:3.6.3
MAINTAINER wuhanstudio 

RUN apt-get update && apt-get install -y build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev r-base-dev

COPY . /usr/local/src/myscripts
WORKDIR /usr/local/src/myscripts

RUN Rscript biblioshiny-install.R
RUN Rscript biblioshiny-devtool.R

EXPOSE 8080
CMD ["Rscript", "biblioshiny-start.R"]

