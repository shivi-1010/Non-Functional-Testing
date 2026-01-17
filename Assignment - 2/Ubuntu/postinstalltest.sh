#!/bin/bash

# Check Apache
if hash apache2 2>/dev/null; then
  APACHE_VERSION=$(apache2 -v | awk -F"/" '{print $2}' | awk '{print $1}')
  if [ "$APACHE_VERSION" = "2.4" ]; then
    echo "Apache 2.4 is installed and is the default version."
  else
    echo "Apache is installed, but the version is not 2.4."
  fi
else
  echo "Apache is not installed."
fi

# Check PHP
if hash php 2>/dev/null; then
  PHP_VERSION=$(php -v | awk -F" " '{print $2}' | awk '{print $1}')
  if [ "$PHP_VERSION" = "7.2" ]; then
    echo "PHP 7.2 is installed and is the default version."
  else
    echo "PHP is installed, but the version is not 7.2."
  fi
else
  echo "PHP is not installed."
fi

# Check PostgreSQL
if hash psql 2>/dev/null; then
  POSTGRESQL_VERSION=$(sudo -u postgres psql -c "SELECT version();" | awk -F" " '{print $2}' | awk -F" " '{print $1}')
  if [ "$POSTGRESQL_VERSION" = "14" ]; then
    echo "PostgreSQL 14 is installed and is the default version."
  else
    echo "PostgreSQL is installed, but the version is not 14."
  fi
else
  echo "PostgreSQL is not installed."
fi

# Check Python
if hash python3 2>/dev/null; then
  PYTHON_VERSION=$(python3 -V 2>&1 | awk -F" " '{print $2}')
  if [ "$PYTHON_VERSION" = "3.7" ]; then
    echo "Python 3.7 is installed and is the default version."
  else
    echo "Python is installed, but the version is not 3.7."
  fi
else
  echo "Python is not installed."
fi