chmod +x /mysql-backup.sh

crontab -e

 azure = Endpoint=https://evis-config-production.azconfig.io;Id=s17+;Secret=6QZvipXS0L1eR59W+r659tqFE06OTzgV59qIm7YX1mI=
 ...............
 ...............
 0 0 * * * /home/ubuntu/LinuxSetup/mysql/mysql-backup.sh
 30 0 * * * env azure=$azure /home/ubuntu/EvisMonitor/LinuxExe/EvisMonitor 2>&1 | /usr/bin/logger -t evis-monitor-error

# every 5 mins
 */5 * * * *

sudo service cron reload

# checking other users cron jobs
crontab -u ubuntu -l
crontab -u ubuntu -e

# cron doesn't have access to env varibales, to make it available, append cmd
. $HOME/.bash_profile; or . $HOME/.profile; 

azure = Endpoint=https://evis-config-production.azconfig.io;Id=s17+;Secret=6QZvipXS0L1eR59W+r659tqFE06OTzgV59qIm7YX1mI=
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
