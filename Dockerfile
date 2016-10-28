FROM ruby:slim

RUN apt-get update \
    && apt-get install -y ruby-dev zlib1g-dev liblzma-dev build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && gem install nokogiri

RUN set -x \
    && apt-get update \
    && apt-get install -y wget libfontconfig1 \
    && rm -rf /var/lib/apt/lists/* \
    https://github.com/Medium/phantomjs/archive/2.1.13.tar.gz
    && wget -O /tmp/phantomjs-2.1.13.tar.gz https://github.com/Medium/phantomjs/archive/2.1.13.tar.gz \
    && apt-get remove -y wget \
    && md5sum /tmp/phantomjs-2.1.13.tar.gz \
        | grep -q "37f8b166f61cf9478e06d7e59177ca42" \
    && tar -xf /tmp/phantomjs-2.1.13.tar.gz -C /tmp \
    && rm -rf /tmp/phantomjs-2.1.13.tar.gz \
    && mv /tmp/phantomjs-2.1.13/bin/phantomjs /usr/local/bin/phantomjs \
    && rm -rf /tmp/phantomjs-2.1.13
