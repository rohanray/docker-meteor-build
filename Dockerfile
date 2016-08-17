FROM          debian:jessie
MAINTAINER    Rohan Ray (https://github.com/rohanray)

COPY scripts /meteor-docker-scripts
COPY utils /utils-scripts
RUN sh /meteor-docker-scripts/main-script.sh

ENTRYPOINT ["echo", "Node app built and ready at /opt/dist"]

ONBUILD COPY ./ /opt/src
ONBUILD RUN sh /meteor-docker-scripts/execute-meteor-build.sh
