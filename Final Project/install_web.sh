# Update the package list to get the latest versions of the packages and their dependencies
sudo apt update

# Install apache2 and mysql-client packages
     sudo apt install -y apache2 mysql-client

# Stop the apache2 service
     sudo systemctl stop apache2

# Install necessary packages to add new repository over HTTPS
sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common -y

# Add the repository for PHP 8.0
     sudo add-apt-repository ppa:ondrej/php

# Install PHP 8.0
     sudo apt install php8.0 -y

# Install additional PHP 8.0 modules required for web development
     sudo apt install -y php8.0-cli php8.0-common php8.0-mysql php8.0-zip php8.0-gd php8.0-mbstring php8.0-curl php8.0-xml php8.0-bcmath

# Start the apache2 service again
     sudo systemctl start apache2