
#!/bin/bash


echo "Pre-installation script"

# Disk Usage
echo "Disk Usage:"
df -h

# RAM Size
echo "RAM Size:"
free -h | awk '/^Mem:/ {print $2}'

# RAM Usage
echo "RAM Usage:"
free -h | awk '/^Mem:/ {print $3}'

# CPU Information
echo "CPU Information:"
lscpu | awk '/^CPU MHz:/ {print $3}'
lscpu | awk '/^Architecture:/ {print $2}'
lscpu | egrep 'Model name|Speed'




