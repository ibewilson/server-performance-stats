#!/bin/bash


#1. Get CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')


#2. Get Memory usage
MEMORY_TOTAL=$(free -m | awk 'NR==2 {print $2}')
MEMORY_USED=$(free -m | awk 'NR==2 {print $3}')
MEMORY_FREE=$(free -m | awk 'NR==2 {print $4}')
MEMORY_USAGE_PERCENT=$((100 * MEMORY_USED / MEMORY_TOTAL))


#3. Get Disk usage
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')
DISK_USAGE_PERCENT=$(df -h / | awk 'NR==2 {print $5}')


#4. Get top 5 processes by CPU usage
TOP_CPU=$(ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -6)


#5. Get top 5 processes by memory usage
TOP_MEM=$(ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -6)


#6. Get OS Version
OS_VERSION=$(lsb_release -d | awk -F"\t" '{print $2}')


#7. Get System Uptime
UPTIME=$(uptime -p)


#8. Get Load Average
LOAD_AVG=$(cat /proc/loadavg | awk '{print $1, $2, $3}')


#9. Get Active User Sessions
ACTIVE_USERS=$(who | wc -l)


#10. Get Number of Running Processes
PROCESS_COUNT=$(ps aux | wc -l)


#11. Get Last System Boot Time
LAST_BOOT=$(who -b | awk '{print $3, $4}')


#12. Get Failed SSH Login Attempts
FAILED_SSH_LOGINS=$(journalctl -u ssh --no-pager | grep "Failed password" | wc -l)


#13. Get Open Network Ports
OPEN_PORTS=$(ss -tulnp | awk '{print $5}' | sort | uniq -c | tail -5)


#14. Get Top 3 Memory-Hungry Users
TOP_MEM_USERS=$(ps aux --sort=-%mem | awk '{print $1}' | uniq -c | sort -nr | head -3)


#15. Get Disk I/O Usage (Read/Write Rate) - Requires sysstat package
DISK_IO=$(iostat -dx 1 1 | tail -n +4)

















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

echo "6. OS Version: $OS_VERSION"
echo ""

echo "7. System Uptime: $UPTIME"
echo ""

echo "8. Load Average (1m, 5m, 15m):"
echo " $LOAD_AVG"
echo ""

echo "9. Active User Sessions: $ACTIVE_USERS"
echo ""

echo "10. Number of Running Processes: $PROCESS_COUNT"
echo ""

echo "11. Last System Boot Time: $LAST_BOOT"
echo ""

echo "12. Failed SSH Login Attempts: $FAILED_SSH_LOGINS"
echo ""

echo "13. Open Network Ports:"
echo "$OPEN_PORTS"
echo ""

echo "14. Top 3 Memory-Hungry Users:"
echo "$TOP_MEM_USERS"
echo ""

echo "15. Disk I/O Usage:"
echo "$DISK_IO"
echo ""



