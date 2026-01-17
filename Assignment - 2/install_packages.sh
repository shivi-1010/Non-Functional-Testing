#!/bin/bash

# Update System
sudo dnf update -y

# Install Apache 2.4
sudo dnf install httpd -y
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

# Install PHP 7.2
sudo dnf install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd -y

# Install Python 3.7 and libraries
sudo dnf install python3.7 -y
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.7 get-pip.py
python3.7 -m pip install beautifulsoup4
python3.7 -m pip install freezegun
python3.7 -m pip install ll-xist
python3.7 -m pip install lxml
python3.7 -m pip install "pillow>=2.3"
python3.7 -m pip install python-ldap
sudo dnf install openldap-devel
sudo dnf install python-devel openldap-devel
sudo dnf install libpq-devel cyrus-sasl-devel python-devel openldap-devel openssl-devel
python3.7 -m pip install psycopg2
python3.7 -m pip install psycopg2-binary
python3.7 -m pip install Sphinx

# Install PostgreSQL 14
sudo dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/F-38-x86_64/pgdg-fedora-repo-latest.noarch.rpm
sudo dnf install postgresql14-server postgresql14 -y
sudo /usr/pgsql-14/bin/postgresql-14-setup initdb
sudo systemctl enable postgresql-14
sudo systemctl start postgresql-14
