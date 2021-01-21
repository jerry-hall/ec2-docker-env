if [[ -z $(which docker) ]]; then
    echo Docker not installed.
    echo Installing Docker... 
    echo
    sudo amazon-linux-extras install docker
    echo
    echo Docker installed.
fi
echo
echo Starting docker...
sudo service docker start
echo
IMAGE_NAME="workspace"
echo Building docker image \"${IMAGE_NAME}\"
sudo docker build -t ${IMAGE_NAME} .

echo
echo Starting image ${IMAGE_NAME}...
echo .....To quit, type exit.....
echo .....To re-connect later, type ./connect.sh.....
echo .....To stop or terminate, type ./stop.sh or ./terminate.....
echo
echo
# Run docker image if the image isn't already running
if [[ -z $(sudo $(docker container ls | grep ${IMAGE_NAME})) ]]
then
    echo Image ID:
    sudo docker run --name ${IMAGE_NAME} -dt ${IMAGE_NAME} 
fi
echo
echo

echo "sudo docker exec -it ${IMAGE_NAME} /bin/bash" > connect.sh
echo "sudo docker stop ${IMAGE_NAME}" > stop.sh
echo "./stop.sh; sudo docker rm ${IMAGE_NAME}" > terminate.sh
chmod +x connect.sh stop.sh terminate.sh

sudo docker exec -it ${IMAGE_NAME} /bin/bash
