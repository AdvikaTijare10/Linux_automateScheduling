# Cron Automation Script

This repository contains a Bash script (`scripts.sh`) designed to automate tasks using **cron** on Windows Subsystem for Linux (WSL). It allows users to schedule recurring jobs and manage automated workflows efficiently.

## Features

- Lightweight Bash script for automation.
- Designed specifically for **WSL** environment.
- Easily customizable for various recurring tasks.
- Supports logging of executed cron jobs.

## Getting Started

### Prerequisites

- **Windows Subsystem for Linux (WSL)** installed.
- Basic knowledge of the terminal and cron jobs.
- Git installed to clone the repository.

### Installation

1. Clone the repository:

```bash
git clone https://github.com/<USERNAME>/<REPO>.git

```
2. Navigate to the project folder
cd <REPO>

3. Make the script executable 
chmod +x scripts.sh

###Usage

1. Open the crontab editor

crontab -e

2. Add the cron job that runs the script at the desired schedule. 

3. Save and exit the editor.
