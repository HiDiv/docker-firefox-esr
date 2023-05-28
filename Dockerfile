FROM ubuntu:16.04
ARG DEBIAN_FRONTEND=noninteractive
ARG TZ='Europe/Kaliningrad'

RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    libglib2.0-0 \
    libgtk-3-0 \
    libdbus-glib-1-2 \
    libstdc++6 \
    libxtst6 \
    libasound2 \
    xserver-xorg \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-68.12.0esr-SSL&os=linux64&lang=en-US" \
    && tar -xf firefox.tar.bz2 -C /opt/ \
    && ln -s /opt/firefox/firefox /usr/bin/firefox \
    && rm firefox.tar.bz2 \
    && wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/install-firefox-linux/firefox.desktop -P /usr/local/share/applications
    
RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

CMD /usr/bin/firefox
