# syntax=docker/dockerfile:experimental
FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:latest
ARG VERSION_NUMBER
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/memcached" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/memcached/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/memcached" \
      com.jitesoft.app.memcached.version="${VERSION_NUMBER}"

ARG TARGETARCH

RUN --mount=type=bind,source=./bin,target=/tmp/bin \
    addgroup -g 1000 memcached \
 && adduser -u 1000 -G memcached -s /bin/sh -D memcached \
 && apk add --no-cache libevent openssl cyrus-sasl \
 && tar -xzf /tmp/bin/${TARGETARCH}.tar.gz -C /usr/local \
 && cp /tmp/bin/entrypoint /usr/local/bin/entrypoint \
 && chown -R memcached:memcached /usr/local/bin \
 && chmod +x /usr/local/bin/entrypoint \
 && memcached --version

ENTRYPOINT ["entrypoint"]
EXPOSE 11211
CMD ["memcached", "-u", "memcached"]
