sudo amazon-linux-extras install docker

echo Starting docker...
sudo service docker start

IMAGE_NAME="workspace"
echo Building docker image \"${IMAGE_NAME}\"
sudo docker build -t ${IMAGE_NAME} .

echo Starting image ${IMAGE_NAME}...
echo .....To quit, type exit.....
echo .....To re-connect later, type ./connect.sh.....
echo .....To stop or terminate, type ./stop.sh or ./terminate.....
sudo docker run --name ${IMAGE_NAME} -dt ${IMAGE_NAME} 

echo "sudo docker exec -it ${IMAGE_NAME} /bin/bash" > connect.sh
echo "sudo docker stop ${IMAGE_NAME}" > stop.sh
echo "./stop.sh; sudo docker rm ${IMAGE_NAME}" > terminate.sh
chmod +x connect.sh stop.sh terminate.sh

sudo docker exec -it ${IMAGE_NAME} /bin/bash