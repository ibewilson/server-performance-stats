#!/bin/bash

# Get CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Get Memory usage
MEMORY_TOTAL=$(free -m | awk 'NR==2 {print $2}')
MEMORY_USED=$(free -m | awk 'NR==2 {print $3}')
MEMORY_FREE=$(free -m | awk 'NR==2 {print $4}')
MEMORY_USAGE_PERCENT=$((100 * MEMORY_USED / MEMORY_TOTAL))

# Get Disk usage
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')
DISK_USAGE_PERCENT=$(df -h / | awk 'NR==2 {print $5}')


# Get top 5 processes by CPU usage
TOP_CPU=$(ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -6)

# Get top 5 processes by memory usage
TOP_MEM=$(ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -6)


# Display System Stats
echo "======================================"
echo "       SERVER PERFORMANCE STATS      "
echo "======================================"
echo ""

echo "1. CPU Usage:"
printf "   Current CPU Usage: %.1f%%\n" "$CPU_USAGE"
echo ""

echo "2. Memory Usage (MB):"
echo "   Total: $MEMORY_TOTAL MB"
echo "   Used:  $MEMORY_USED MB"
echo "   Free:  $MEMORY_FREE MB"
echo "   Usage: $MEMORY_USAGE_PERCENT%"
echo ""

echo "3. Disk Usage (Root Partition):"
echo "   Total: $DISK_TOTAL"
echo "   Used:  $DISK_USED"
echo "   Free:  $DISK_FREE"
echo "   Usage: $DISK_USAGE_PERCENT"
echo ""

echo "4. Top 5 Processes by CPU Usage:"
echo "$TOP_CPU"
echo ""

echo "5. Top 5 Processes by Memory Usage:"
echo "$TOP_MEM"
echo ""
