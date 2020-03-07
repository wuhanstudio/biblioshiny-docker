FROM r-base:3.6.3
MAINTAINER wuhanstudio 

RUN apt-get update && apt-get install git
RUN git clone https://github.com/wuhanstudio/bibliometrix
RUN tar -cvzf bibliometrix.tar.gz bibliometrix

COPY . /usr/local/src/myscripts
WORKDIR /usr/local/src/myscripts

RUN Rscript biblioshiny-install.R 
RUN R CMD INSTALL bibliometrix.tar.gz

CMD ["Rscript", "biblioshiny-start.R"]

