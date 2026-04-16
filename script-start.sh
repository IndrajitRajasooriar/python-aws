#!/bin/bash
set -e

systemctl enable --now docker

sleep 3

docker run -d -p 5000:5000 python:3.11 python -m http.server 5000