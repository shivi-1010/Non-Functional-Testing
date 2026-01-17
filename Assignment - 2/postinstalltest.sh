

#!/bin/bash

echo "Post-installation script"
echo "Checking installed packages"

# Function to check if a package is installed
is_installed() {
  if hash $1 2>/dev/null; then
    echo "Yes"
  else
    echo "No"
  fi
}

# Function to check if the correct version of a package is set to be default
is_version_default() {
  if [ "$(get_default_version $1)" = "$2" ]; then
    echo "Yes"
  else
    echo "No"
  fi
}

# Function to get the default version of a package
get_default_version() {
  if [ "$1" = "apache2" ]; then
    apache2 -v | awk -F"/" '{print $2}' | awk '{print $1}'
  elif [ "$1" = "php" ]; then
    php -v | awk -F" " '{print $2}' | awk -F"-" '{print $1}'
  elif [ "$1" = "postgresql" ]; then
    sudo -u postgres psql -c "SELECT version();" | awk -F" " '{print $2}' | awk -F" " '{print $1}'
  elif [ "$1" = "python3" ]; then
    python3 -V 2>&1 | awk -F" " '{print $2}'
  fi
}

# Check if Apache 2.4 is installed and is the default version
if is_installed apache2 && is_version_default apache2 "2.4"; then
  echo "Apache 2.4 is installed and is the default version."
else
  echo "Apache 2.4 is not installed or not set as the default version."
fi

# Check if PHP 7.2 is installed and is the default version
if is_installed php && is_version_default php "7.2"; then
  echo "PHP 7.2 is installed and is the default version."
else
  echo "PHP 7.2 is not installed or not set as the default version."
fi

# Check if PostgreSQL 14 is installed and is the default version
if is_installed postgresql && is_version_default postgresql "14"; then
  echo "PostgreSQL 14 is installed and is the default version."
else
  echo "PostgreSQL 14 is not installed or not set as the default version."
fi

# Check if Python 3.7 is installed and is the default version
if is_installed python3.7; then
  echo "Python 3.7 is installed."
  if is_version_default python3 "3.7"; then
    echo "Python 3.7 is set as the default version."
  else
    echo "Python 3.7 is not set as the default version."
  fi
else
  echo "Python 3.7 is not installed."
fi

# Check for Python libraries
python_libraries=("beautifulsoup4" "freezegun" "ll-xist" "lxml" "pillow>=2.3" "psycopg2" "python-ldap" "Sphinx")
for library in "${python_libraries[@]}"
do
  if python3.7 -c "import $library" > /dev/null 2>&1; then
    echo "$library is installed."
  else
    echo "$library is not installed."
  fi
done


# #!/bin/bash
# echo "Post-installation script"
# echo "Checking installed packages"

# # Check if Apache 2.4 is installed
# apache2 -v | grep "Apache/2.4" > /dev/null 2>&1
# if [ $? -eq 0 ]; then
#     echo "Apache 2.4 is installed."
# else
#     echo "Apache 2.4 is not installed."
# fi

# # Check if PHP 7.2 is installed
# php -v | grep "PHP 7.2" > /dev/null 2>&1
# if [ $? -eq 0 ]; then
#     echo "PHP 7.2 is installed."
# else
#     echo "PHP 7.2 is not installed."
# fi

# # Check if PostgreSQL 14 is installed
# psql -V | grep "psql (PostgreSQL) 14" > /dev/null 2>&1
# if [ $? -eq 0 ]; then
#     echo "PostgreSQL 14 is installed."
# else
#     echo "PostgreSQL 14 is not installed."
# fi

# # Check if Python 3.7 is installed
# python3.7 -V > /dev/null 2>&1
# if [ $? -eq 0 ]; then
#     echo "Python 3.7 is installed."
# else
#     echo "Python 3.7 is not installed."
# fi

# # Check for Python libraries
# python_libraries=("beautifulsoup4" "freezegun" "ll-xist" "lxml" "pillow>=2.3" "psycopg2" "python-ldap" "Sphinx")
# for library in "${python_libraries[@]}"
# do
#     python3.7 -c "import $library" > /dev/null 2>&1
#     if [ $? -eq 0 ]; then
#         echo "$library is installed."
#     else
#         echo "$library is not installed."
#     fi
# done
