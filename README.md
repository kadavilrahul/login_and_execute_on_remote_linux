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

# Automated command execution on remote server:
- Enter following credentials in the main.sh script before execution

```bash
DEFAULT_USER=""
DEFAULT_PORT=""
DEFAULT_IP=""
DEFAULT_PASS=""
```

- Then run the command execution script
```bash
bash main.sh
```
# Test scripts

```bash
bash test_login_manually.sh # Enter credentials
```

```bash
bash test_run_commands_with_manual_login.sh # Enter credentials and commands
```

## ⚠️ Security Note

- 🔐 Never store sensitive credentials in the scripts
- 🛡️ Use SSH keys for authentication
- 👥 Ensure proper permissions on script files
- 🔒 Review automated commands before execution

## 📝 License

This project is open source and available under the MIT License.
