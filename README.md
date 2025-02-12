# 🚀 Remote Linux Login and Command Execution

This repository contains shell scripts for automated remote Linux server login and command execution.

## 📁 Repository Contents

- `login.sh` 🔑 - Script for handling secure SSH login to remote Linux servers
- `run_commands_automatically.sh` ⚡ - Script for automated command execution on remote servers
- `run_commands_with_login.sh` 🔄 - Script combining login and command execution functionality

## 🛠️ Features

- 🔒 Secure SSH authentication
- 📝 Automated command execution
- ⚙️ Configurable remote server settings
- 🔄 Error handling and validation
- 🤖 Automated workflow options
- 🔗 Combined login and execution capabilities

## 🚦 Prerequisites

- Linux/Unix environment
- SSH access to remote server
- Proper SSH key configuration

## 📋 Usage

# Basic login: login to remote server
```bash
bash login.sh
```
# Automated command execution: Enter following credentials in the script before execution

DEFAULT_USER=""
DEFAULT_PORT=""
DEFAULT_IP=""
DEFAULT_PASS=""

Then run the command execution script
```bash
bash run_commands_automatically.sh
```
# Combined login and command execution
```bash
bash run_commands_with_login.sh
```

## ⚠️ Security Note

- 🔐 Never store sensitive credentials in the scripts
- 🛡️ Use SSH keys for authentication
- 👥 Ensure proper permissions on script files
- 🔒 Review automated commands before execution

## 📝 License

This project is open source and available under the MIT License.

## ✍️ Author

Rahul Kadavil
