#!/bin/bash

# Update the package lists for upgrades and new package installations
sudo apt -y update
      # sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
      # sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

# Install MySQL server package
      sudo apt install -y mysql-server

# Create a new database called 'hospital'
      sudo mysql -u root  -e "CREATE DATABASE hospital"

# Create a new MySQL user 'root' with access from the IP '192.168.33.20' and password 'root'
      sudo mysql -u root  -e "CREATE USER 'root'@'192.168.33.20' IDENTIFIED BY 'root';"

# Grant the user 'root' all privileges on all databases and tables from the IP '192.168.33.20'
      sudo mysql -u root  -e "GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'root'@'192.168.33.20' WITH GRANT OPTION;"

# Apply the new privileges immediately
      sudo mysql -u root  -e "FLUSH PRIVILEGES;"

# Import the 'hospital' database schema from the provided SQL file
      sudo mysql -u root  hospital < /vagrant-db/hospital.sql

# Allow MySQL to listen on all interfaces by changing the bind-address in the configuration file
      sudo sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
      sudo sed -i 's/^mysqlx-bind-address/#mysqlx-bind-address/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart the MySQL service to apply the configuration changes
      sudo systemctl restart mysql