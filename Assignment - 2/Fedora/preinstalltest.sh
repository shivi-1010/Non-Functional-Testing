
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






# #!/bin/bash

# # Check disk usage
# disk_usage=$(df -h | awk '$5 ~ /[0-9]{2}%/ {print $5}')

# # Check RAM size
# ram_size=$(free -h | awk '/^Mem:/ {print $2}')

# # Check CPU speed
# cpu_speed=$(lscpu | grep "CPU MHz" | awk '{print $3}')

# # Check if disk usage is above a certain threshold
# if [ "$disk_usage" -gt 80 ]; then
#     echo "Disk usage is above 80%."
#     echo "Please free up disk space before installation."
#     exit 1
# fi

# # Check if RAM size is below 2GB
# if [ "$ram_size" -lt 2 ]; then
#     echo "RAM size is below 2GB."
#     echo "Please add more RAM before installation."
#     exit 1
# fi

# # Check if CPU speed is above a certain threshold
# if [ "$cpu_speed" -lt 1000 ]; then
#     echo "CPU speed is below 1000MHz."
#     echo "Please upgrade your CPU before installation."
#     exit 1
# fi

# # If all requirements are met, proceed with installation
# echo "All installation requirements are met."
