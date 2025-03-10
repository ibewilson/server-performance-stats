
# Server-Performance-Stats

## Project Overview
This bash script monitors system performance by collecting CPU, memory, disk, network, and security metrics.
It helps DevOps and Security Engineers track real-time server health and identify potential performance bottlenecks.

-----------------------------------------------------------------------------

## Features

### System Performance Monitoring
- CPU Usage Monitoring - Displays real-time CPU load.
- Memory Usage Tracking - Shows used, free, and total RAM.
- Disk Usage Monitoring - Checks available and used disk space.
- Process Monitoring - Lists the top 5 CPU & memory-consuming processes.
- System Load Average - Displays system load for 1, 5, and 15-minute intervals.

### User & System Uptime Information
- System Uptime - Displays how long the system has been running.
- Active User Sessions - Lists logged-in users.
- Last System Boot Time - Shows the last time the server restarted.
- Number of Running Processes - Counts the total number of running processes.

### Security & Network Monitoring
- Failed SSH Login Attempts - Counts unauthorized login attempts.
- Open Network Ports - Lists listening ports on the server.
- Top 3 Memory-Heavy Users - Displays the users consuming the most RAM.
- Disk I/O Usage - Monitors disk read/write speeds.
- OS Version Information - Shows the operating system version and details.

-----------------------------------------------------------------------------

## Installation & Usage

### 1. Clone the Repository

In bash:

git clone https://github.com/ibewilson/server-performance-stats.git
cd server-performance-stats

### 2. Make the Script Executable
chmod +x server-stats.sh

### 3. Run the Script
./server-stats.sh


### Example Output:

#### SERVER PERFORMANCE STATS
 
1. CPU Usage:          15.2%
2. Memory Usage:       64%
3. Disk Usage:         45%
4. Load Average:       0.08 0.05 0.02
5. Active Users:       2
6. Failed SSH Logins:  5
7. Top 5 CPU-Intensive Processes:
  PID  PPID CMD                    %CPU
 1234     1 /usr/lib/firefox        30.1
 2345  1234 /usr/bin/chrome         25.2
 3456  2345 /usr/bin/node           15.8
 4567  3456 /usr/bin/java           10.3
 5678  4567 /usr/bin/python          8.1

### Project Page
https://ibewilson.github.io/server-performance-stats/

### Author
Ibewilson

### License
This project is open-source under the MIT License.

##### Roadmap link
https://roadmap.sh/projects/server-stats
