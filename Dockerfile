FROM showtimeanalytics/java-jdk:8u51
MAINTAINER Alberto Gregoris <alberto@showtimeanalytics.com>

#Set environment
ENV MAVEN_MAYOR_VERSION 3
ENV MAVEN_VERSION=3.3.9
ENV MAVEN_RELEASE_NAME=apache-maven-${MAVEN_VERSION}
ENV MAVEN_TGZ_ARCHIVE=http://ftp.heanet.ie/mirrors/www.apache.org/dist/maven/maven-${MAVEN_MAYOR_VERSION}/${MAVEN_VERSION}/binaries/${MAVEN_RELEASE_NAME}-bin.tar.gz
ENV PATH=/opt/mvn/bin:${PATH}

# Install and configure maven
RUN cd /opt \
  && echo $JAVA_HOME \
  && curl -sS -k "${MAVEN_TGZ_ARCHIVE}" | gunzip -c - | tar -xf - \
  && mv ${MAVEN_RELEASE_NAME} mvn

# Copy git default credentials
#ADD gitconfig /root/.gitconfig
#ADD git-credentials /root/.git-credentials

WORKDIR /opt/src
ENTRYPOINT ["/bin/bash", "-c"]
