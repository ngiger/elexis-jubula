FROM  ngiger/jubula_runner:0.4.1
MAINTAINER Niklaus Giger "niklaus.giger@member.fsf.org"

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libmysqlclient-dev ruby-full build-essential libssl-dev libcurl4-openssl-dev libreadline-dev && \
    gem install bundler --no-ri --no-rdoc && \
    apt-get clean; rm -rf /var/lib/apt/lists/*
RUN mkdir -p /app /tmp/.X11-unix/ && chmod 1777 /tmp/.X11-unix/  /var/lib/apt/lists

WORKDIR /app
CMD ['/bin/bash']
