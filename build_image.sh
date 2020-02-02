registry=registry.gitlab.com/sevheng/xplore-nginx
tag=latest

if [ "$1" != '' ]; 
then
    tag=$1
fi

echo "Docker building image"
docker build -t $registry:$tag .
echo "Docker pushing image"
docker push $registry:$tag
echo "Docker finish"