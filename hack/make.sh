#!/usr/bin/env bash

# exit if any command returns a non-zero status
set -e

MY_DIR="$(dirname "${BASH_SOURCE[0]}")"

# This script is meant to be run inside the
# docker development environment
function help() {
    echo "USAGE:"
    echo "    start: Start the jupyter notebook"
    echo ""
}

if [ $# -lt 1 ]; then
    help
    exit 1
fi

function start() {
    export PATH=/work/micropython/unix:$PATH
    jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --notebook-dir=$MY_DIR/notebooks
}

case "$1" in
    'start'):
        start
        ;;
    *):
        help
        ;;
esac

