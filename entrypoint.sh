#!/bin/sh
set -euo pipefail

PREFIX="TOR_"

env | grep "^$PREFIX" | sed "s/^$PREFIX//" | sed "s/=/ /" >/etc/tor/torrc

exec "$@"