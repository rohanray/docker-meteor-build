FROM          roray/jessie-init-for-meteor 
MAINTAINER    Rohan Ray (https://github.com/rohanray)

COPY scripts /meteor-docker-scripts

ENTRYPOINT ["echo", "Node app built and ready at /opt/dist"]

ONBUILD COPY ./ /opt/src
ONBUILD RUN sh /meteor-docker-scripts/execute-meteor-build.sh
