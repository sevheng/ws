#!/bin/bash
registry=docker.pkg.github.com/sevheng/ws/nginx
tag="latest"

color_white='\e[0m'
color_green='\e[32m'

echo "\n${color_green}$repo:$tag is building...${color_white}\n"
docker build --pull -q -t $registry:$tag .

echo "\n${color_green}Pushing $repo:$tag to registry...${color_white}\n"
docker push $registry:$tag

# echo "\n${color_green}Pushing $repo:$currentDate to registry...${color_white}\n"
# docker push $registry$repo:$currentDate