#!/usr/bin/env bash
set -e
DOCKER_IMAGE=nickgrealy/rust:20210406
sudo timedatectl set-timezone Australia/Sydney
sudo mkdir -p /rust && sudo chmod 777 /rust && sudo chown -R 1000:1000 /rust
docker run --rm -v /rust:/home/rustserver --entrypoint /opt/init.sh ${DOCKER_IMAGE}
docker run --rm -v /rust:/home/rustserver --name rust-instgame ${DOCKER_IMAGE} auto-install
docker run --rm -v /rust:/home/rustserver --name rust-instmods ${DOCKER_IMAGE} mods-update

# https://umod.org/plugins?categories=rust
mkdir -p /rust/serverfiles/oxide/plugins
xargs -n 1 curl --remote-name < /rust/scripts/oxidemods.txt
mv *.cs /rust/serverfiles/oxide/plugins/
chown -R 1000:1000 /rust/serverfiles/oxide

# start server
docker run -d -p 28015:28015/udp -p 28016:28016 -v /rust:/home/rustserver --restart=unless-stopped --name rust ${DOCKER_IMAGE} start
