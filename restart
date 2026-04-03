#!/usr/bin/env bash
set -euo pipefail

NAME="cse130"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --name)
      shift
      if [[ $# -eq 0 || -z "${1:-}" ]]; then
        echo "Error: --name requires a container name." >&2
        echo "Usage: $0 [--name <container-name>]" >&2
        exit 1
      fi
      NAME="$1"
      shift
      ;;
    *)
      echo "Usage: $0 [--name <container-name>]" >&2
      exit 1
      ;;
  esac
done

docker start -ai "$NAME"
