#!/bin/bash

# Default credentials
DEFAULT_USER="root"
DEFAULT_PORT="22"

# Get server details with user input
read -p "Enter server IP/hostname: " server_host
while [[ -z "$server_host" ]]; do
    read -p "Server IP/hostname cannot be empty. Please enter: " server_host
done

read -p "Enter username [$DEFAULT_USER]: " server_user
server_user=${server_user:-$DEFAULT_USER}

read -p "Enter port [$DEFAULT_PORT]: " server_port
server_port=${server_port:-$DEFAULT_PORT}

read -s -p "Enter server password: " server_pass
while [[ -z "$server_pass" ]]; do
    echo
    read -s -p "Password cannot be empty. Please enter: " server_pass
done
echo

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
echo -e "\n=== Remote Server Command Execution ==="
echo "Server: $server_host"
echo "User: $server_user $([ "$server_user" == "$DEFAULT_USER" ] && echo "(default)")"
echo "Port: $server_port $([ "$server_port" == "$DEFAULT_PORT" ] && echo "(default)")"

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