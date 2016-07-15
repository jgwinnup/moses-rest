#
# Docker File for Moses-Based AFRL MT 
#

FROM ubuntu:14.04
MAINTAINER Jeremy Gwinnup, Air Force Research Laboratory <jeremy.gwinnup.1@us.af.mil>

RUN apt-get update && apt-get install -q -y \
	unzip \
	make \
	g++-4.7 \
	wget \
	git \
	mercurial \
	bzip2 \
	autotools-dev \
	automake \
	libtool \
	zlib1g-dev \
	libbz2-dev \
	libboost-all-dev \
	libxmlrpc-core-c3-dev \
	libxmlrpc-c++8-dev \
	libcmph-dev \
	libboost-all-dev \
	libgoogle-perftools-dev \
	python-cherrypy3 \
	python-levenshtein \
	python-simplejson \
	python-pip 

#RUN pip install Flask

RUN mkdir -p /home/moses
WORKDIR /home/moses

#build moses
RUN git clone https://github.com/moses-smt/mosesdecoder moses
WORKDIR /home/moses/moses
RUN git checkout perf_moses2
RUN ./bjam variant=release toolset=gcc-4.8 link=static --with-xmlrpc-c=/usr --with-cmph=/usr --with-mm --with-probing-pt --with-boost=/usr

#Make working dirs
WORKDIR /home/moses
RUN mkdir -p bin lm models config

#copy python rest script
WORKDIR /home/moses
COPY bin bin
COPY config config
COPY runme.sh runme.sh

EXPOSE 8080

#fin
WORKDIR /home/moses
