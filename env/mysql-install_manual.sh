making root as user
# sudo -i 

sudo apt install mysql-server

mysql --version

sudo mysql_secure_installation

service mysql status

vi /etc/mysql/mysql.conf.d/mysqld.cnf

# modify bind-address 127.0.0.1 to 0.0.0.0

sudo systemctl restart mysql

sudo mysql -u root

create database evis;

show databases;

#drop other databases
drop database sys;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'Evis@123';

FLUSH PRIVILEGES;

CREATE USER 'evis'@'%' IDENTIFIED BY 'Evis@123';

GRANT ALL PRIVILEGES ON * . * TO 'evis'@'%';

FLUSH PRIVILEGES;

# REVOKE PERMISSION_TYPE ON database_name.table_name FROM 'evis'@'localhost';

# REVOKE ALL PRIVILEGES ON * . * FROM 'evis'@'localhost';

# DROP USER 'evis'@'localhost';

# SHOW GRANTS FOR 'evis'@'localhost';

GRANT ALL PRIVILEGES ON * . * TO 'root'@'localhost' with grant option;

GRANT ALL PRIVILEGES ON * . * TO 'evis'@'%' WITH GRANT OPTION;

SET @@global.time_zone = '+00:00';
SET @@session.time_zone = '+00:00';

# Only for amazon linux
CREATE USER 'evis'@'ec2-13-233-225-237.ap-south-1.compute.amazonaws.com' IDENTIFIED BY 'Evis@123';
GRANT ALL PRIVILEGES ON *.* TO 'evis'@'ec2-13-233-225-237.ap-south-1.compute.amazonaws.com';
FLUSH PRIVILEGES;

 SELECT user, host FROM mysql.user where user='evis' and host='localhost';

SET GLOBAL log_bin_trust_function_creators = 1;


