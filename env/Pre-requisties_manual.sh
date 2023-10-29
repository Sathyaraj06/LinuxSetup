sudo apt update
sudo apt install git

# Docker compose

sudo apt-get install curl 
sudo apt-get install gnupg 
sudo apt-get install ca-certificates 
sudo apt-get install lsb-release
sudo apt install docker-compose


 sudo docker rm -f $(sudo docker ps -aq)

 sudo docker rmi $(sudo docker images -q)

 sudo docker rmi $(sudo docker images --filter "dangling=true" -q --no-trunc)

 sudo docker volume prune

 sudo docker network prune

 sudo docker images

 sudo docker ps -a

 sudo docker restart $(sudo docker ps -a -q)

 sudo systemctl restart docker

 df -H         --show available storage space

 sudo lsof -i -P -n | grep LISTEN        ---List of ports exposed in linux

# avoid password prompt everytime
git config --global credential.helper store

export azure="Endpoint=https://evis-prod.azconfig.io;Id=JajY;Secret=fZ5lXS1sizAxNEtuXf3hxpcJAY1lt2CjkkkC9s40yH8="

printenv azure
# list all env variables
