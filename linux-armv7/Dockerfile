FROM octoblu/meshblu-connector-builder-base:ruby-armv7

WORKDIR /work
RUN [ "cross-build-start" ]

RUN apt-get update --fix-missing \
  && apt-get install -y --no-install-recommends \
    build-essential \
    python \
    python2.7 \
    curl \
    libusb-1.0-0-dev \
    libbluetooth-dev \
    libudev-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/node && \
  curl --silent -L https://nodejs.org/dist/v8.1.0/node-v8.1.0-linux-armv7l.tar.xz | tar --strip 1 -xJ -C /opt/node
RUN mkdir -p /opt/yarn && \
  curl --silent -L https://yarnpkg.com/latest.tar.gz | tar --strip 1 -xz -C /opt/yarn
ENV PATH /opt/yarn/bin:/opt/node/bin:$PATH
RUN mkdir -p /tmp/cache && chmod 777 /tmp/cache
RUN gem install deb-s3

RUN [ "cross-build-end" ]
ENTRYPOINT [ "/usr/bin/qemu-arm-static", "/usr/bin/env", "QEMU_EXECVE=1" ]
