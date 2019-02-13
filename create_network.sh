#!/usr/bin/env bash

docker network create --gateway 172.16.1.1 --subnet 172.16.1.0/24 mongo_net