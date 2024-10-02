git config --global credential.helper store

git clone https://github.com/Sathyaraj06/rasa-evis.git
git clone https://github.com/Sathyaraj06/DashboardApiLiveagent.git
git clone https://github.com/Sathyaraj06/Directline.git
git clone https://github.com/Sathyaraj06/EvisDashboard.git
git clone https://github.com/Sathyaraj06/BotReceiver.git
git clone https://github.com/Sathyaraj06/MyChatHub.git
git clone https://github.com/Sathyaraj06/LinuxSetup.git
git clone https://github.com/Sathyaraj06/Evisbot.git

git config --global credential.helper store

cd DashboardApiLiveagent
chmod 777 deploy.sh
./deploy.sh
cd ..

cd BotReceiver
chmod 777 deploy.sh
./deploy.sh
cd ..

cd EvisDashboard
chmod 777 deploy.sh
./deploy.sh
cd ..

cd Evisbot
chmod 777 deploy.sh
./deploy.sh
cd ..

cd Directline
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


docker update --restart unless-stopped $(docker ps -q)
