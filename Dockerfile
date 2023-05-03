FROM eclipse/rdf4j-workbench

VOLUME /data

# from compose args
ARG CONF_REPO
ARG CONF_BRANCH

ENV RDF4J_VERSION=3.7.7
ENV CONF_BASE=/opt/conf_base
ENV CONF_DIR=${CONF_BASE}/config/updatetriplestore

ENV WORKSPACE=/opt/OBASK
RUN mkdir $WORKSPACE

ENV BUILD_OUTPUT=${WORKSPACE}/build.out

USER root
RUN apt-get -qq  update && apt-get install -y git && apt-get install -y unzip

# SDK
RUN curl -sS -o /tmp/rdf4j.zip -L http://download.eclipse.org/rdf4j/eclipse-rdf4j-${RDF4J_VERSION}-sdk.zip && \ 
    cd /opt && \
    unzip /tmp/rdf4j.zip && \
    rm /tmp/rdf4j.zip 

RUN mkdir $CONF_BASE

COPY process.sh /opt/OBASK/process.sh

RUN chmod +x /opt/OBASK/*.sh

CMD ["/opt/OBASK/process.sh"]
