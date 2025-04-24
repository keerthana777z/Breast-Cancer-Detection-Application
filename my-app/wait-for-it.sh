#!/bin/sh
# wait-for-it.sh

set -e

host="$1"
shift
cmd="$@"

echo "Waiting for $host:5003..."
until nc -z $host 5003; do
  echo "Still waiting for $host:5003..."
  sleep 2
done

echo "$host:5003 is available, starting now..."
exec $cmd
