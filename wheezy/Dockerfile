# Use Debian Wheezy update 11
FROM debian:7.11
MAINTAINER Niklaus Giger "niklaus.giger@member.fsf.org"

#    apt-get install -y libreoffice-writer # to be able to use ODF documents
# iceweasel # to be able to display web pages
# icedove # to be able to send-email
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends abiword \
    iceweasel \
    icedove \
    libxext-dev libxrender-dev libxtst-dev wget unzip \
    libwebkitgtk-1.0-0 \
    xvfb xterm x11-xserver-utils x11-apps \
    locales-all ruby zip maven htop lsof strace sudo vim \
    fluxbox xinit metacity vnc4server xvnc4viewer curl git bundler \
    mysql-client-5.5 postgresql-client-9.1 oracle-java8-installer \
    wmctrl libreoffice-writer scrot xdotool && \
    apt-get clean; rm -rf /var/lib/apt/lists/*

# x11-apps: to be able to take a screen-shot inside the container using xwd  -root -out screen.xwd
# must be converted to png using "convert screen.xwd screen.png" (on host)
# also some tools like lsof htop to debug problems
# we want wmctrl to maximize Elexis
# xdotool to send some command to Elexis
# scrot to create screenshots from the command line
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends telnet && \
    apt-get clean; rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app /tmp/.X11-unix/ && chmod 1777 /tmp/.X11-unix/  /var/lib/apt/lists/
WORKDIR /app
COPY assets/* /app/
CMD ['/bin/bash']
