### modified https://hub.docker.com/r/davidcaste/alpine-tomcat/~/dockerfile/

FROM davidcaste/alpine-java-unlimited-jce:jre8 

MAINTAINER CitizenGaia (github.com)

ENV TOMCAT_MAJOR=8 \
    TOMCAT_VERSION=8.5.3 \
    TOMCAT_HOME=/opt/tomcat \
    CATALINA_HOME=/opt/tomcat \
    CATALINA_OUT=/dev/null \
    LISTEN_PORT=8080

RUN apk upgrade --update && \
    apk add --update curl && \
    curl -jksSL -o /tmp/apache-tomcat.tar.gz http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    gunzip /tmp/apache-tomcat.tar.gz && \
    tar -C /opt -xf /tmp/apache-tomcat.tar && \
    ln -s /opt/apache-tomcat-${TOMCAT_VERSION} ${TOMCAT_HOME} && \
    rm -rf ${TOMCAT_HOME}/webapps/* && \
    apk del curl && \
    rm -rf /tmp/* /var/cache/apk/*

COPY logging.properties ${TOMCAT_HOME}/conf/logging.properties
COPY server.xml ${TOMCAT_HOME}/conf/server.xml

#Externalising Tomcat logs:
ENV LOG_VOLUME /hostfs/tomcat/logs
RUN rm -r $CATALINA_HOME/logs
RUN ln -s $LOG_VOLUME $CATALINA_HOME/logs

RUN rm -rfv $CATALINA_HOME/webapps
RUN mkdir $CATALINA_HOME/webapps
RUN rm -rfv $CATALINA_HOME/work
RUN mkdir $CATALINA_HOME/work
COPY docker-entrypoint.sh /
COPY verify-container.sh /
RUN mkdir /Manifest
RUN touch /Manifest/version.properties

EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["run"]

