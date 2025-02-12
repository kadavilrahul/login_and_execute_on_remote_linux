#!/bin/bash

# Server credentials
server_host=""          # Replace with your server IP
server_user=""          # Replace with your username
server_pass=""          # Replace with your password
server_port=""          # Replace with your port if different from 22

# Define your commands here
# Add or remove commands as needed
commands=(
    "sudo apt update"
    "df -h"
    "free -m"
    "uptime"
    "ls -la"
    # Add more commands below
    # "your_command_here"
)

# Check if sshpass is installed
if ! command -v sshpass &> /dev/null; then
    echo "Installing sshpass..."
    sudo apt-get install sshpass -y
fi

# Function to execute remote commands
execute_remote_command() {
    sshpass -p "$server_pass" ssh -o StrictHostKeyChecking=no -p "$server_port" "$server_user@$server_host" "$1"
}

# Main execution
echo "=== Remote Server Command Execution ==="
echo "Server: $server_host"
echo "User: $server_user"
echo "Port: $server_port"

# Show summary of commands to be executed
echo -e "\nCommands to be executed:"
for ((i=0; i<${#commands[@]}; i++)); do
    echo "$((i+1)). ${commands[i]}"
done

# Ask for final confirmation
read -p $'\nDo you want to proceed with execution? (y/N): ' proceed
proceed=${proceed:-N}

if [[ "${proceed,,}" == "y" ]]; then
    echo -e "\nExecuting commands..."
    # Execute each command
    for cmd in "${commands[@]}"; do
        echo -e "\nExecuting: $cmd"
        execute_remote_command "$cmd"
        echo "------------------------"
    done
    
    echo "All commands executed successfully!"
else
    echo "Execution cancelled."
    exit 0
fi