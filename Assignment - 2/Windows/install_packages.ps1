
# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Apache
choco install apache --version=2.4 -y

# Install PHP
choco install php --version=7.2 -y

# Install PostgreSQL
choco install postgresql --version=14 -y

# Install Python
choco install python --version=3.7 -y

# Add installations to PATH
$env:Path += ";C:\tools\php;C:\tools\apache\bin;C:\Program Files\PostgreSQL\14\bin;C:\Python37\Scripts"

# Verify installations
apache -v
php -v
pg_config --version
python --version


