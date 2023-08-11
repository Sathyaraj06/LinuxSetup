chmod +x /mysql-backup.sh

crontab -e

 0 0 * * * /home/ubuntu/LinuxSetup/mysql/mysql-backup.sh
 0 1 * * * . $HOME/.profile; /home/ubuntu/EvisMonitor/LinuxExe/EvisMonitor 2>&1 | /usr/bin/logger -t tag1

 */5 * * * * /home/ubuntu/LinuxSetup/mysql/mysql-backup.sh

sudo service cron reload

# checking other users cron jobs
crontab -u ubuntu -l
crontab -u ubuntu -e

. $HOME/.bash_profile

# to see history
cat /var/log/syslog

SET SQL_SAFE_UPDATES = 0;
delete FROM evis.exceptionlog;
