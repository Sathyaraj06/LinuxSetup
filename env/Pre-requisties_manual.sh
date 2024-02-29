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

 docker load < busybox.tar.gz

 docker update --restart unless-stopped $(docker ps -q)

 df -H         --show available storage space

 sudo lsof -i -P -n | grep LISTEN        ---List of ports exposed in linux

# avoid password prompt everytime
git config --global credential.helper store

export azure="Endpoint=https://evis-prod-configuration.azconfig.io;Id=xmYm;Secret=Bmh4N9rp3ZX3gR7/XdiQy/ZNbz6bE37cbQBQ1HNF2Y8="

printenv azure
# list all env variables

cd DashboardApiLiveagent
chmod 777 deploy.sh
./deploy.sh
cd ..

cd BotReceiver
chmod 777 deploy.sh
./deploy.sh
cd ..

cd DashboardLiveagent
chmod 777 deploy.sh
./deploy.sh
cd ..

cd evis
chmod 777 deploy.sh
./deploy.sh
cd ..

cd MyChatHub
chmod 777 deploy.sh
./deploy.sh
cd ..

cd MyChatHub
chmod 777 deploy.sh
./deploy.sh
cd ..

cd LinuxSetup/tools
chmod 777 deploy_nginx.sh
./deploy_nginx.sh

chmod 777 deploy_portainer.sh
./deploy_portainer.sh

chmod 777 deploy_webssh2.sh
./deploy_webssh2.sh

cd ..
cd ..
