FROM yyz1989/rdf4j

VOLUME /data

# from compose args
ARG CONF_REPO
ARG CONF_BRANCH

ENV CONF_BASE=/opt/conf_base
ENV CONF_DIR=${CONF_BASE}/config/updatetriplestore

ENV WORKSPACE=/opt/VFB

ENV BUILD_OUTPUT=${WORKSPACE}/build.out

RUN apt-get -qq update || apt-get -qq update && \
apt-get -qq -y install git

RUN mkdir $CONF_BASE

COPY process.sh /opt/VFB/process.sh
# COPY rdf4j_vfb.txt /opt/VFB/rdf4j_vfb.txt

RUN chmod +x /opt/VFB/*.sh

CMD ["/opt/VFB/process.sh"]
