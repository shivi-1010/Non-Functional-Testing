#!/bin/bash

# Update the system
sudo apt-get update -y

# Install Apache
sudo apt-get install apache2 -y

# Install PHP 7.2
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y -u
sudo apt-get update -y
sudo apt-get install php7.2 -y

# Install Python 3.7
sudo apt update -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y -u
sudo apt install python3.7 -y

# Install pip for Python 3.7
sudo apt install python3-pip -y
sudo apt install python3.7-distutils -y
curl https://bootstrap.pypa.io/get-pip.py | sudo python3.7
sudo apt-get install build-essential -y
sudo apt-get install python3.7-dev -y

# Install Python libraries
python3.7 -m pip install beautifulsoup4 freezegun ll-xist lxml pillow psycopg2 python-ldap Sphinx
sudo apt-get install libpq-dev -y

pip3 install beautifulsoup4
pip3 install freezegun
pip3 install ll-xist
pip3 install lxml
sudo apt-get install libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk -y
python3.7 -m pip install --upgrade pip
python3.7 -m pip install --upgrade Pillow --no-binary :all:
sudo apt-get install python3-pillow -y
pip3 install "pillow>=2.3"
pip3 install psycopg2
pip3 install python3-ldap
sudo apt-get install python3-sphinx -y
python3.7 -m pip install Sphinx
pip3 install Sphinx
sudo apt-get install libpq-dev -y
sudo apt-get install python3-ldap -y
sudo apt-get install -y libxslt-dev
sudo apt-get install -y libjpeg8-dev zlib1g-dev
sudo apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev
sudo apt-get install python-dev libldap2-dev libsasl2-dev libssl-dev -y
sudo apt-get install libldap2-dev -y
sudo apt-get install libsasl2-dev python-dev libldap2-dev libssl-dev -y

# Install PostgreSQL 14
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
sudo apt-get update -y
sudo apt-get install postgresql-14 -y
