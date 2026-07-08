#!/bin/sh

set -e

case "${1-}" in
	"")
		;;
	-*)
		;;
	*)
		if command -v "$1" >/dev/null 2>&1 || [ -x "$1" ]; then
			exec "$@" || exit $?
		fi
		;;
esac

# Run HTSServer
exec /usr/bin/htsserver /usr/share/httrack/ --port "$PORT" "$@"
