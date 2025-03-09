#!/bin/bash

# This gets CPU usage using 'top' and 'awk'

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Display CPU Usage
echo "++++++++++++++++++++++++++++++++++++++"
echo "       SERVER PERFORMANCE STATS      "
echo "++++++++++++++++++++++++++++++++++++++"
echo ""
echo "1. CPU Usage:"
printf "   Current CPU Usage: %.1f%%\n" "$CPU_USAGE"
echo ""
