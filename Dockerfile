FROM          debian:jessie
MAINTAINER    Rohan Ray (https://github.com/rohanray)

COPY scripts /meteor-docker-scripts
RUN chmod -R 755 /meteor-docker-scripts
RUN ls -la /meteor-docker-scripts
RUN sh /meteor-docker-scripts/main-script.sh

ENTRYPOINT ["top", "-b"]