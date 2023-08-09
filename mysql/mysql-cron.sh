chmod +x /mysql-backup.sh

crontab -e

# 0 2 * * * root /mysql-backup.sh

SET SQL_SAFE_UPDATES = 0;
delete FROM evis.exceptionlog;
