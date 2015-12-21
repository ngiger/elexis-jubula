# Use Debian Wheezy update 8
FROM debian:7.8
MAINTAINER Niklaus Giger "elexis.giger@member.fsf.org"

#    apt-get install -y libreoffice-writer # to be able to use ODF documents
# iceweasel # to be able to display web pages
# icedove # to be able to send-email
RUN apt-get update && \
    apt-get install -y abiword \
    iceweasel \
    icedove \
    libxext-dev libxrender-dev libxtst-dev wget unzip \
    libwebkitgtk-1.0-0 \
    xvfb xterm x11-xserver-utils x11-apps \
    locales-all ruby zip maven htop lsof strace sudo vim \
    fluxbox xinit metacity vnc4server xvnc4viewer

# x11-apps: to be able to take a screen-shot inside the container using xwd  -root -out screen.xwd
# must be converted to png using "convert screen.xwd screen.png" (on host)
# also some tools like lsof htop to debug problems

# Install Oracle Java-8 and accept automatically its license
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get update && \
    apt-get install -y oracle-java8-installer \

RUN useradd --uid 1200 --user-group --create-home --shell /bin/bash elexis && \
    echo "elexis ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/elexis && \
    chmod 0440 /etc/sudoers.d/elexis && \
    mkdir -p elexis /home/elexis/work /home/elexis/results
USER elexis
# ADD Gemfile /home/elexis/Gemfile
# RUN gem install --no-ri --no-rdoc bundler
# RUN cd /home/elexis && sudo -Hu elexis bundle install --without debugger
VOLUME /home/elexis
# we want to allow storing the maven repository in a different directory to speed things up!
VOLUME /home/elexis/.m2
# expose a debug port for Java
EXPOSE 8000
CMD /bin/bash
WORKDIR /home/elexis

# cleanup (minimizes size of generated image)
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*


