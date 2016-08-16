FROM          debian:jessie
MAINTAINER    Rohan Ray (https://github.com/rohanray)

COPY scripts /meteor-docker-scripts
RUN sh /meteor-docker-scripts/main-script.sh

ENTRYPOINT ["sh", "/meteor-docker-scripts/execute-meteor-build.sh"]

ONBUILD COPY  ./ /opt/src