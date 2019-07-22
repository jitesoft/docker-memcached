FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:latest
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/memcached" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/memcached/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/memcached"


ARG VERSION_NUMBER
ENV VERSION_NUMBER="${VERSION_NUMBER}"

COPY ./memcached.tar.gz /tmp/memcached.tar.gz
COPY ./entrypoint /usr/local/bin/

RUN addgroup -g 1000 memcached \
 && adduser -u 1000 -G memcached -s /bin/sh -D memcached \
 && apk add --no-cache libevent openssl cyrus-sasl \
 && apk add --no-cache --virtual .build-deps build-base autoconf automake git libevent-dev openssl-dev cyrus-sasl-dev \
 && mkdir /tmp/memcached-src \
 && tar -xzf /tmp/memcached.tar.gz -C /tmp/memcached-src --strip-components=1 \
 && rm /tmp/memcached.tar.gz \
 && cd /tmp/memcached-src \
 && apk add --no-cache   \
 && ./autogen.sh 2>/dev/null \
 && ./configure \
    --quiet \
    --enable-sasl \
    --enable-64bit \
    --disable-coverage \
    --disable-docs \
 && make -j2 \
 && make install \
 && apk del .build-deps \
 && chown -R memcached:memcached /usr/local/bin \
 && chmod +x /usr/local/bin/entrypoint \
 && rm -rf /tmp/memcached-src \
 && memcached --version

ENTRYPOINT ["entrypoint"]
EXPOSE 11211
CMD ["memcached", "-u", "memcached"]
