FROM dockerfile/java:latest

#MAINTAINER Abhinav Pobbati <apobbati@codeblock.io>
Matt Koski <maccam912@gmail.com>

WORKDIR /opt/titan

RUN curl -o /opt/titan.zip http://s3.thinkaurelius.com/downloads/titan/titan-0.5.3-hadoop2.zip

RUN unzip /opt/titan.zip -d /opt/ && \
    rm /opt/titan.zip

ADD rexster-titan.xml.template /opt/titan/
ADD run.sh /opt/titan/
EXPOSE 8182
EXPOSE 8183
EXPOSE 8184

RUN chmod +x /opt/titan/run.sh

CMD ["/bin/sh", "-e", "/opt/titan/run.sh"]
