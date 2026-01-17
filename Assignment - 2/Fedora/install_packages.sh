#!/bin/bash

# Update System
sudo dnf -y update

# Install Apache 2.4
sudo dnf -y install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

# Install PHP 7.2
sudo dnf -y install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd

# Install Python 3.7 and libraries
sudo dnf -y install python3.7
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3.7 get-pip.py
sudo python3.7 -m pip install beautifulsoup4 freezegun ll-xist lxml "pillow>=2.3" python-ldap
sudo dnf install libpq-devel
sudo dnf install openldap-devel
python3.7 -m pip install psycopg2
python3.7 -m pip install python-ldap
sudo dnf install openldap-devel
python3.7 -m pip install python-ldap
sudo dnf -y install openldap-devel python-devel libpq-devel cyrus-sasl-devel openssl-devel
sudo python3.7 -m pip install beautifulsoup4 freezegun ll-xist lxml "pillow>=2.3" python-ldap

# Install required packages for psycopg2 and python-ldap
sudo dnf -y install libpq-devel openldap-devel python-devel cyrus-sasl-devel openssl-devel

# Install psycopg2 and python-ldap
sudo python3.7 -m pip install psycopg2 psycopg2-binary python-ldap

# Install Sphinx
sudo python3.7 -m pip install Sphinx

#!/bin/bash

# Update System
sudo dnf -y update

# Install PostgreSQL Repository
sudo dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/F-38-x86_64/pgdg-fedora-repo-latest.noarch.rpm

# Install PostgreSQL 14
sudo dnf -y install postgresql14-server postgresql14

# Initialize the database
sudo /usr/pgsql-14/bin/postgresql-14-setup initdb

# Enable and start the service
sudo systemctl enable postgresql-14
sudo systemctl start postgresql-14
