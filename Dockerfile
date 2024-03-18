###############################################################
# Dockerfile to build container images for UMIcollapse
# https://github.com/Daniel-Liu-c0deb0t/UMICollapse
# Based on ubuntu:20.04
################################################################

FROM ubuntu:20.04

# File Author / Maintainer
LABEL maintainer="Naoto Kubota <naotok@ucr.edu>"

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get -qq update && \
	apt-get -qq install -y \
	gcc git less make wget xxd zlib1g-dev g++ apt-file zsh-dev \
	libbz2-dev liblzma5 liblzma-dev curl zip gfortran libpcre2-dev libcurl4-openssl-dev libssl-dev xml2 && \
	apt-file update

# Install Java
RUN apt-get update && apt-get install -y default-jre

# Install UMICollapse (version 1.0.0)
RUN cd /usr/src && \
	git clone https://github.com/Daniel-Liu-c0deb0t/UMICollapse.git && \
	cd UMICollapse && \
	mkdir lib && \
	cd lib && \
	curl -O -L https://repo1.maven.org/maven2/com/github/samtools/htsjdk/2.19.0/htsjdk-2.19.0.jar && \
	curl -O -L https://repo1.maven.org/maven2/org/xerial/snappy/snappy-java/1.1.7.3/snappy-java-1.1.7.3.jar && \
	cd ../ && \
	./build.sh

# Set PATH
ENV PATH $PATH:/usr/src/UMICollapse

# Set working directory
WORKDIR /home

# bash
CMD ["bash"]
