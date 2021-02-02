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


RUN cd tmp ; wget https://github.com/DerrickWood/kraken2/archive/master.zip
RUN cd tmp ; unzip kraken2-master.zip  
RUN mkdir -p /opt/kraken2 
RUN cd tmp/kraken2-master ; ./install_kraken2.sh /opt/kraken2 
RUN ln -s /opt/kraken2/kraken2 /usr/local/bin/kraken2 
RUN ln -s /opt/kraken2/kraken2-build /usr/local/bin/kraken2-build 
RUN ln -s /opt/kraken2/kraken2-inspect /usr/local/bin/kraken2-inspect


WORKDIR /data
