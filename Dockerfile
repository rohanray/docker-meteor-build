FROM          roray/jessie-init-for-meteor 
MAINTAINER    Rohan Ray (https://github.com/rohanray) [rohanray@outlook.com]

COPY scripts /meteor-docker-scripts

ONBUILD COPY ./ /opt/src
ONBUILD RUN sh /meteor-docker-scripts/execute-meteor-build.sh
