# Memcached
![Architectures](https://img.shields.io/badge/architectures-arm64%20%7C%20amd64-0.svg)

[![Docker Pulls](https://img.shields.io/docker/pulls/jitesoft/memcached.svg)](https://hub.docker.com/r/jitesoft/memcached)
[![pipeline status](https://gitlab.com/jitesoft/dockerfiles/memcached/badges/master/pipeline.svg)](https://gitlab.com/jitesoft/dockerfiles/memcached/commits/master)
[![Back project](https://img.shields.io/badge/Open%20Collective-Tip%20the%20devs!-blue.svg)](https://opencollective.com/jitesoft-open-source)

Memcached - with sasl enabled - on Alpine linux.

## Tags

Tags are based on memcached version, where `latest` is the latest build.

### Docker Hub

* `jitesoft/memcached`
    * `latest`, `1.6.x`

### GitHub

* `ghcr.io/jitesoft/memcached`
  * `latest`, `1.6.x`

### Quay.io

* `quay.io/jitesoft/memcached`
    * `latest`, `1.6.x`  

### GitLab

* `registry.gitlab.com/jitesoft/dockerfiles/memcached`
    * `latest`, `1.6.x`

Dockerfile and other source files can be found at [GitLab](https://gitlab.com/jitesoft/dockerfiles/memcached) or [GitHub](https://gitlab.com/jitesoft/dockerfiles/memcached).

## Notes

Due to no publicly available pgp keys nor sha-sums for the releases of memcached, the binary is not verified on build. 
This should be seen as a potential security concern and you should consider this before running the memcached image in production.  
The program is built from source with the tarball downloaded from [GitHub](https://github.com/memcached/memcached/releases).

## Usage

Start the memcached container and expose the default port (`11211`).

```bash
docker run --rm -p 11211:11211 -d jitesoft/memcached 
telnet localhost 11211

> set testing 0 900 10
> test-value
>
> get testing
```

For more advanced usage, check out the Memcached [wiki](https://github.com/memcached/memcached/wiki).

### memcached user

Containers created runs as root (easily changed in production with the appropriate flags),
while the memcached process runs as the memcached user (1000) by default.

## License

This repository (Dockerfile and code) is released under the [MIT](https://gitlab.com/jitesoft/dockerfiles/memcached/blob/master/LICENSE) license.

Memcached license:

```text
Copyright (c) 2003, Danga Interactive, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

    * Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

    * Redistributions in binary form must reproduce the above
copyright notice, this list of conditions and the following disclaimer
in the documentation and/or other materials provided with the
distribution.

    * Neither the name of the Danga Interactive nor the names of its
contributors may be used to endorse or promote products derived from
this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

## Image labels

This image follows the [Jitesoft image label specification 1.0.0](https://gitlab.com/snippets/1866155).

## Sponsors

Sponsoring is vital for the further development and maintaining of open source projects.  
Questions and sponsoring queries can be made via <a href="mailto:sponsor@jitesoft.com">email</a>.  
If you wish to sponsor our projects, reach out to the email above or visit any of the following sites:

[Open Collective](https://opencollective.com/jitesoft-open-source)  
[GitHub Sponsors](https://github.com/sponsors/jitesoft)  
[Patreon](https://www.patreon.com/jitesoft)

Jitesoft images are built via GitLab CI on runners hosted by the following wonderful organisations:

<a href="https://fosshost.org/">
  <img src="https://raw.githubusercontent.com/jitesoft/misc/master/sponsors/fosshost.png" width="256" alt="Fosshost logo" />
</a>

_The companies above are not affiliated with Jitesoft or any Jitesoft Projects directly._
