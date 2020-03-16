registry=registry.gitlab.com/rovool/core/ws
tag=latest

if [ "$1" != '' ]; 
then
    tag=$1
fi

color_white='\e[0m'
color_green='\e[32m'

echo "\n${color_green}Building...${color_white}\n"
docker build -q -t $registry:$tag .
echo "\n${color_green}Pushing to registry...${color_white}\n"
docker push $registry:$tag