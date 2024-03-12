#!/bin/bash

cat <<EOT > /root/.vimrc
set expandtab
set tabstop=2
set shiftwidth=2
EOT

# init scenario
rm $0
mkdir -p /opt/ks

# scenario specific
cat >> /root/data/Dockerfile1 <<EOF
FROM nginx:alpine
RUN echo 'Service with variable from $BASE_VAR file with merged $OVERRIDE_VAR file' > /usr/share/nginx/html/index.html
EOF

docker build --tag app-1 /root/data/Dockerfile1

cat >> /root/compose.yml <<EOF
services:
  web-1:
    image: app-1
    environment:
      - BASE_VAR=base
    ports:
      - "80:80"
EOF

cat >> /root/compose.override.yml <<EOF
services:
    environment:
      - OVERRIDE_VAR=base
EOF

rm -rf /root/data

podman run -d \
  --restart=always \
  --name registry \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:5000 \
  -p 5000:5000 \
  docker.io/library/registry:2

echo '172.30.1.2 local-registry' >> /etc/hosts

cat >> /etc/containers/registries.conf <<EOF
[[registry]]
location="local-registry:5000"
insecure=true
EOF

cp /etc/docker/daemon.json /etc/docker/daemon.json.tmp
cat /etc/docker/daemon.json.tmp | grep -v registry-mirrors | grep -v \} > /etc/docker/daemon.json
cp /etc/docker/daemon.json /etc/docker/daemon.json.tmp
echo "$(cat /etc/docker/daemon.json.tmp)," > /etc/docker/daemon.json

cat >> /etc/docker/daemon.json <<EOF
  "registry-mirrors": ["http://local-registry:5000", "https://mirror.gcr.io", "https://docker-mirror.killer.sh"],
  "insecure-registries": ["local-registry:5000"]
}
EOF
systemctl daemon-reload
systemctl enable docker
systemctl restart docker


# mark init finished
touch /ks/.initfinished