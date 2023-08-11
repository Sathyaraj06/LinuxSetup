chmod +x /mysql-backup.sh

crontab -e

 0 0 * * * /home/ubuntu/rasa-evis/support/mysql_backup/mysql-backup.sh
 0 1 * * * /home/ubuntu/EvisMonitor/LinuxExe/EvisMonitor

sudo service cron reload

# checking other users cron jobs
crontab -u ubuntu -l
crontab -u ubuntu -e

SET SQL_SAFE_UPDATES = 0;
delete FROM evis.exceptionlog;
