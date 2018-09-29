#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for FullNode.jar"

  set -- FullNode.jar "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "FullNode.jar" ]; then
  mkdir -p "$TRON_DATA"
  chmod 700 "$TRON_DATA"
  chown -R tron "$TRON_DATA"

  echo "$0: setting data directory to $TRON_DATA"

  set -- "$@" -d "$TRON_DATA"
fi

if [ "$1" = "FullNode.jar" ] || [ "$1" = "SolidityNode.jar" ] || [ "$1" = "java-tron.jar" ]; then
  echo

  set -- "$@" -c /java-tron/main_net_config.conf

  exec gosu tron java -jar /java-tron/build/libs/"$@"
fi

echo
exec "$@"
