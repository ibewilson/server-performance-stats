#!/bin/bash

# Get CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Get Memory usage
MEMORY_TOTAL=$(free -m | awk 'NR==2 {print $2}')
MEMORY_USED=$(free -m | awk 'NR==2 {print $3}')
MEMORY_FREE=$(free -m | awk 'NR==2 {print $4}')
MEMORY_USAGE_PERCENT=$((100 * MEMORY_USED / MEMORY_TOTAL))

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
