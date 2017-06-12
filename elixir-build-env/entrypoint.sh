#!/bin/sh
set -euo pipefail

setUp() {
    local result=$(id -u builder > /dev/null 2>&1)
    if [ -z "$result" ]; then
        addgroup builder -g "$USER"
        adduser builder -u "$GROUP" -s /bin/ash -SDG builder
        cp -R /mnt/.ssh /home/builder/.ssh
        chown -R builder:builder /home/builder/.ssh
    fi
}

runAsBuilder() {
    su-exec builder "$@"
}

setUp
runAsBuilder "$@"
