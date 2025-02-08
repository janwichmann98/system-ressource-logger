#!/bin/bash

# This script continuously monitors and logs system resource usage including
# CPU, RAM, and Disk space on a Linux system.

# Usage:
#   Make this script executable and run it.
#   It will append the current resource usage to a log file every INTERVAL seconds.

# Requirements:
#   - Linux-based system
#   - Bash shell
#   - Utilities: top, free, df, awk, sed

# Configuration
LOG_FILE="system_resource_log.txt"  # Log file where data will be stored
INTERVAL=60                         # Logging interval in seconds

# -----------------------------------------------------------------------------
# log_resources
# -----------------------------------------------------------------------------
# Logs the current CPU, RAM, and Disk usage with a timestamp.
# -----------------------------------------------------------------------------
log_resources() {
    # Get current timestamp in YYYY-MM-DD HH:MM:SS format
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    
    # CPU usage: extract idle percentage from top output and calculate usage
    CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/")
    CPU_USAGE=$(awk "BEGIN {printf \"%.2f%%\", 100 - $CPU_IDLE}")
    
    # Memory usage: extract used and free memory (in MB) from free command
    MEMORY_USAGE=$(free -m | awk 'NR==2 {printf "Used: %s MB, Free: %s MB", $3, $4}')
    
    # Disk usage: extract usage information for the root filesystem
    DISK_USAGE=$(df -h / | awk 'NR==2 {printf "%s used out of %s", $3, $2}')
    
    # Append the log entry to the log file
    echo "$TIMESTAMP - CPU: $CPU_USAGE, RAM: $MEMORY_USAGE, Disk: $DISK_USAGE" >> "$LOG_FILE"
}

# -----------------------------------------------------------------------------
# Main Execution Loop
# -----------------------------------------------------------------------------
echo "Starting System Resource Logger..."
echo "Logging system resources every $INTERVAL seconds. Press [CTRL+C] to stop."

# Run the logger in an infinite loop
while true; do
    log_resources
    sleep $INTERVAL
done
