chmod +x /mysql-backup.sh

crontab -e

 azure = Endpoint=https://evis-prod-configuration.azconfig.io;Id=xmYm;Secret=Bmh4N9rp3ZX3gR7/XdiQy/ZNbz6bE37cbQBQ1HNF2Y8=
 ...............
 ...............
 0 0 * * * /root/evis/LinuxSetup/env/mysql-backup.sh
 30 0 * * * env azure=$azure /home/ubuntu/EvisMonitor/LinuxExe/EvisMonitor 2>&1 | /usr/bin/logger -t evis-monitor-error

# every 5 mins
 */5 * * * *

sudo service cron reload

# checking other users cron jobs
crontab -u ubuntu -l
crontab -u ubuntu -e

# cron doesn't have access to env varibales, to make it available, append cmd
. $HOME/.bash_profile; or . $HOME/.profile; 

azure = Endpoint=https://evis-prod-configuration.azconfig.io;Id=xmYm;Secret=Bmh4N9rp3ZX3gR7/XdiQy/ZNbz6bE37cbQBQ1HNF2Y8=
 30 0 * * * env azure=$azure /home/ubuntu/EvisMonitor/LinuxExe/EvisMonitor 2>&1 | /usr/bin/logger -t monitor-error


# to see history
grep CRON /var/log/syslog

# to see all history
cat /var/log/syslog
cat /var/log/syslog.1

SET SQL_SAFE_UPDATES = 0;
delete FROM evis.exceptionlog;

#to start the stopped mysql service
sudo /etc/init.d/mysql start
