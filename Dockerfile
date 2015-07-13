FROM debian:wheezy
MAINTAINER Werner Schmid

RUN apt-get update && apt-get install -y build-essential git libfuse-dev libcurl4-openssl-dev libxml2-dev mime-support automake libtool
RUN git clone https://github.com/s3fs-fuse/s3fs-fuse /s3fs


RUN cd /s3fs && ./autogen.sh && ./configure --prefix=/usr --with-openssl && make && make install
RUN rm -rf /s3fs
RUN mkdir /s3bucket

RUN echo "/s3bucket		*(rw,sync,fsid=0,crossmnt,no_subtree_check,no_root_squash)" >> /etc/exports

ADD run.sh /opt/bin/run.sh

CMD /opt/bin/run.sh
