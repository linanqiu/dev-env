#!/usr/bin/bash

sudo service docker start
sleep 2
docker pull ghcr.io/linanqiu/dev-env:latest
sudo docker run --rm -p 8888:8888 -p 4000:4000 -v "/mnt/c/users/linan/Documents/dev/mount-volume":/home/jovyan -e JUPYTER_RUNTIME_DIR='/tmp' -e GRANT_SUDO=yes --user root --name dev-env ghcr.io/linanqiu/dev-env:latest start-notebook.sh --NotebookApp.custom_display_url='http://localhost:8888'
