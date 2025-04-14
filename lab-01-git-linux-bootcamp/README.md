## 🧪 Lab 1: Git + Linux Bootcamp
**Objective:** Build fluency in Linux fundamentals, Git workflows, and automation using Bash, Python, and Go.

---

## 📌 Objective
Establish foundational DevSecOps skills by:
- Practicing Linux file permissions, SSH, and shell utilities
- Writing a backup automation script in Bash, Python, and Go
- Applying real-world Git workflows (branches, PRs, tags)
- Documenting and structuring a Git-based lab project

---

## 🧠 Skills & Tools Used
- Linux CLI: user management, file permissions (`chmod`, `chown`, `umask`)
- Bash scripting
- Python 3 standard library (`os`, `shutil`, `logging`)
- Go basics (`os`, `log`, `time`)
- Git CLI & GitHub: feature branching, pull requests, tagging

---

## 🗂️ Folder Structure
```
lab-01-git-linux-bootcamp/
├── backup.sh         # Bash script
├── backup.py         # Pythonic version
├── backup.go         # Go implementation (learning-focused)
├── logs/             # Script-generated logs
├── .gitignore        # Ignore patterns for logs, temp files
├── README.md         # This doc
└── notes.md          # Observations, reflections, commands
```

---

## 🚀 Setup & Usage

### 🔧 Prerequisites
- macOS or Linux environment with:
  - Bash
  - Python 3.10+
  - Go 1.20+
  - Git

### 🔍 Running the Scripts

**Bash:**
```bash
chmod +x backup.sh
./backup.sh
```

**Python:**
```bash
python3 backup.py
```

**Go:**
```bash
go run backup.go
```

Logs will be saved to `logs/backup.log`.

---

## 🧪 Testing the Lab
- Create and back up sample folders under `/tmp/` or your home directory
- Simulate failure cases by removing source directory or using permission-restricted paths
- Validate log entries for success/failure and timestamps

---
