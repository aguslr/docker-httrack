ARG BASE_IMAGE=library/debian:stable-slim

FROM docker.io/${BASE_IMAGE}

ENV DATA=/var/www/websites
ENV PORT=8080

RUN <<-EOT sh
	set -eu

	apt-get update
	env DEBIAN_FRONTEND=noninteractive \
		apt-get install -y --no-install-recommends curl httrack webhttrack \
		-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
	apt-get clean && rm -rf /var/lib/apt/lists/* /var/lib/apt/lists/*
EOT

COPY rootfs/ /

EXPOSE 8080/tcp

USER www-data

HEALTHCHECK --interval=1m --timeout=3s \
  CMD timeout 2 curl -sfo /dev/null 'http://127.0.0.1:8080'

ENTRYPOINT ["/entrypoint.sh"]
