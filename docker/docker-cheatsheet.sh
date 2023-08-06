
 sudo docker rm -f $(sudo docker ps -aq)

 sudo docker rmi $(sudo docker images -q)

 sudo docker rmi $(sudo docker images --filter "dangling=true" -q --no-trunc)

 sudo docker volume prune

 sudo docker network prune

 sudo docker images

 sudo docker ps -a

 sudo docker restart $(sudo docker ps -a -q)

 sudo systemctl restart docker

 show available storage space

 df -H

