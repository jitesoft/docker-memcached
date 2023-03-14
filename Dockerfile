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
      com.jitesoft.app.memcached.version="${VERSION_NUMBER}" \
      # Open container labels
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.created="${BUILD_TIME}" \
      org.opencontainers.image.description="Memcached on Alpine linux" \
      org.opencontainers.image.vendor="Jitesoft" \
      org.opencontainers.image.source="https://gitlab.com/jitesoft/dockerfiles/memcached" \
      # Artifact hub annotations
      io.artifacthub.package.alternative-locations="oci://index.docker.io/jitesoft/memcached,oci://ghcr.io/jitesoft/memcached,oci://quay.io/jitesoft/memcached" \
      io.artifacthub.package.readme-url="https://gitlab.com/jitesoft/dockerfiles/memcached/-/raw/master/README.md" \
      io.artifacthub.package.logo-url="https://jitesoft.com/favicon-96x96.png"

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
