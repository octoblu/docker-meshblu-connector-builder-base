FROM ruby:2.4.1

WORKDIR /work

RUN apt-get update --fix-missing \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    build-essential \
    python \
    python2.7 \
    curl \
    libusb-1.0-0-dev \
    libbluetooth-dev \
    libudev-dev \
    dpkg-sig \
    openssl \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/node && \
  curl --silent -L https://nodejs.org/dist/v8.3.0/node-v8.3.0-linux-x64.tar.xz | tar --strip 1 -xJ -C /opt/node
RUN mkdir -p /opt/yarn && \
  curl --silent -L https://yarnpkg.com/latest.tar.gz | tar --strip 1 -xz -C /opt/yarn
ENV PATH /opt/yarn/bin:/opt/node/bin:$PATH
RUN mkdir -p /tmp/cache && chmod 777 /tmp/cache
RUN gem install deb-s3
