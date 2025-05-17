#!/usr/bin/env python3

import os
import sys
import argparse
import logging
from datetime import datetime
import shutil

'''
# TODO: backup.py
	•	Import required modules (os, sys, argparse, logging, datetime, shutil)
	•	Define constants for log directory, backup base directory, and log file path
	•	Implement argument parsing with argparse (positional source_dir, help/version flags)
	•	Ensure the log directory exists and configure the logging module to append to the log file
	•	Validate that the provided source directory exists; log error and exit if not
	•	Generate a timestamp and construct the destination backup path under the backup base directory
	•	Ensure the backup base directory exists; create it if necessary
	•	Create the timestamped destination directory, failing if it already exists
	•	Copy the source directory tree to the destination, logging success or catching exceptions, logging failures, and exiting
	•	(Optional) Recursively adjust permissions on the new backup to mirror the Bash script’s behavior
	•	Log a final “completed successfully” message
	•	Wrap execution in a main() function and protect with an if __name__ == "__main__": guard
'''

LOGFILE = os.path.expanduser("~/logs/backup.log")
TIMESTAMP = datetime.now().strftime("%Y%m%d-%H%M%S")
DIRECTORY= "sys.argv[1]" #placeholder
BACKUP_BASE_DIRECTORY = os.path.expanduser("~/backups")
BACKUP_DIRECTORY = f"{BACKUP_BASE_DIRECTORY}/{DIRECTORY}-{TIMESTAMP}"
USAGE = "EXPECTED USAGE: $0 [directory]"

print(BACKUP_DIRECTORY)