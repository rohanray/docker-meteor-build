FROM          debian:jessie
MAINTAINER    Rohan Ray (https://github.com/rohanray)

RUN apt-get purge -y `apt-mark showauto` && apt-get remove --purge -y `apt-mark showauto`
RUN apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y
RUN apt-get update
RUN apt-get install -y --no-install-recommends gcc libc6-dev make libssl-dev git wget curl ca-certificates sudo bzip2 apt-utils

#RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
#	&& locale-gen en_US.utf8 \
#	&& /usr/sbin/update-locale LANG=en_US.UTF-8

#ENV LC_ALL en_US.UTF-8
#ENV LANG en_US.UTF-8

# all Meteor things
RUN curl https://install.meteor.com/ | sh
COPY  ./ /app
RUN cd /app && meteor npm install
EXPOSE 3000 3001

# ENTRYPOINT [ "sh", "-c", "env && cd /app && meteor --verbose" ]
ENTRYPOINT [ "sh", "-c", "env && apt-get install -y g++ build-essential python && cd /app && meteor build --directory /mbuild --verbose && ls -la /mbuild/bundle" ]

# _post_clean.sh
#RUN apt-get purge -y build-essential g++ python && apt-get remove --purge -y build-essential g++ python
#RUN apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y
#RUN rm -rf /var/lib/apt/lists/* && cp -R /usr/share/locale/en\@* /tmp/ && rm -rf /usr/share/locale/* && mv /tmp/en\@* /usr/share/locale/
#RUN rm -rf /usr/share/doc /usr/share/doc-base /usr/share/man /usr/share/locale /usr/share/zoneinfo /var/cache/debconf/*-old
#RUN rm -rf /var/lib/cache /var/lib/log && rm -rf /tmp/*
