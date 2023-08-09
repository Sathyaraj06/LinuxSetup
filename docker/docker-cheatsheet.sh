
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

export azure="Endpoint=https://evis-configuration.azconfig.io;Id=Y0lT-l0-s0:U4+fnNu37owDqeYPlBmp;Secret=YzCR2hHPgL3lKAkNA3rFr9NU/+UuycrZU6hvxNfkqLs="

printenv azure
# list all env variables
