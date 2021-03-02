#!/usr/bin/env bash
sudo sysctl -w vm.max_map_count=262144
docker-compose -f docker-compose.yml up --build -d
