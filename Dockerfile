ARG BASE_IMAGE=library/debian:stable-slim

FROM docker.io/${BASE_IMAGE}

ENV PUID=0
ENV PGID=0
ENV DATA=/root/websites
ENV PORT=8080

RUN <<-EOT sh
	set -eu

	apt-get update
	env DEBIAN_FRONTEND=noninteractive \
		apt-get install -y --no-install-recommends httrack webhttrack supervisor \
		-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
	apt-get clean && rm -rf /var/lib/apt/lists/* /var/lib/apt/lists/*

	mkdir -p /var/log/supervisord /var/run/supervisord /etc/supervisor.d
EOT

COPY rootfs/ /

EXPOSE 8080/tcp

HEALTHCHECK --interval=1m --timeout=3s \
  CMD timeout 2 curl -sfo /dev/null 'http://127.0.0.1:8080'

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisord.conf"]
