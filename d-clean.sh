#deleting local docker images in bulk based on a search string
#usage: ./d-clean <image search string>

echo "pattern: $1";

docker images -a |  grep $1

echo -n "Do you want to delete all above images (y/n)? "

read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo 'Deleting images...'
    docker images -a | grep $1 | awk '{print $3}' | xargs docker rmi
else
    echo 'exiting..'
fi

echo 'complete'
