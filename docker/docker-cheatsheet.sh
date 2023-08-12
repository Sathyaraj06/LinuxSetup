
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

export azure="Endpoint=https://evis-config-production.azconfig.io;Id=s17+;Secret=6QZvipXS0L1eR59W+r659tqFE06OTzgV59qIm7YX1mI="

printenv azure
# list all env variables
