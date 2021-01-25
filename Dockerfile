FROM continuumio/miniconda3
MAINTAINER Natalia Savytska

#Environmental Variables/Paths
ENV PATH="/opt/kraken2:${PATH}"
ENV PATH="/opt/bracken/:${PATH}"
ENV TERM=xterm

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y build-essential
RUN apt-get install -y wget 
RUN apt-get install -y zip
RUN apt-get install -y bash
RUN apt-get install -y make
RUN apt-get install -y nano
RUN apt-get install -y ncbi-blast+


RUN cd tmp ; wget https://github.com/savytskanatalia/Kraken-Bracken/raw/master/Bracken-master.zip 
RUN cd tmp ; unzip Bracken-master.zip  
RUN mkdir -p /opt/bracken 
RUN cd tmp/Bracken-master ; cp bracken /opt/bracken/ ; cp bracken-build /opt/bracken/ ; cp -R src/ /opt/bracken/ 
RUN cd /opt/bracken/src/ ; make 
WORKDIR /data
