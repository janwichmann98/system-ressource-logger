# System Resource Logger

A simple Bash script for continuously monitoring and logging system resource usage (CPU, RAM, and Disk Space) on Linux systems. This project demonstrates automation skills and practical experience in Linux-based monitoring solutions.

## Features
- Continuous monitoring of CPU usage.
- Memory (RAM) usage tracking.
- Disk space utilization monitoring.
- Timestamped log entries stored in a text file.

## Requirements
- Linux-based operating system.
- Bash shell.
- Standard Linux utilities: `top`, `free`, `df`, `awk`, and `sed`.

## Installation and Usage

1. Clone the repository:
    ```bash
   git clone https://github.com/janwichmann98/System-Resource-Logger.git


2. Navigate to the project directory:
    ```bash
    cd System-Resource-Logger


3. Make the script executable:
    ```bash
    chmod +x system_resource_logger.sh

4. Run the script:
    ```bash
    ./system_resource_logger.sh

The script will create (or append to) a file named system_resource_log.txt in the project directory, logging resource usage every 60 seconds by default.

## Customization
- Adjusting the Logging Interval:
  Modify the INTERVAL variable in system_resource_logger.sh to change how frequently the system resources are logged.

- Changing the Log File:
  Update the LOG_FILE variable if you prefer a different file name or path for the log output.

## License
This project is licensed under the MIT License. See the [MIT LICENSE](LICENSE) file for details.
