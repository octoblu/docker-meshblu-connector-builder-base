FROM ruby:2.4.1

WORKDIR /work
ENV npm_config_arch ia32

RUN dpkg --add-architecture i386
RUN apt-get update --fix-missing \
  && apt-get install -y --no-install-recommends \
    gcc-multilib g++-multilib \
    ca-certificates \
    build-essential \
    python:i386 \
    python2.7:i386 \
    lib32stdc++6 \
    curl \
    libusb-1.0-0:i386 \
    libusb-1.0-0-dev:i386 \
    libbluetooth-dev:i386 \
    libudev-dev:i386 \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/node && \
  curl --silent -L https://nodejs.org/dist/v8.1.0/node-v8.1.0-linux-x86.tar.xz | tar --strip 1 -xJ -C /opt/node
RUN mkdir -p /opt/yarn && \
  curl --silent -L https://yarnpkg.com/latest.tar.gz | tar --strip 1 -xz -C /opt/yarn
ENV PATH /opt/yarn/bin:/opt/node/bin:$PATH
RUN mkdir -p /tmp/cache && chmod 777 /tmp/cache
RUN gem install deb-s3
