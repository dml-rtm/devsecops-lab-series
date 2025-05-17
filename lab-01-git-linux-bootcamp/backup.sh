#!/bin/bash
# Backup script


LOGFILE=~/logs/backup.log
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
DIRECTORY=$1
BACKUP_DIRECTORY=$HOME/backups/$DIRECTORY"-"$TIMESTAMP
USAGE="EXPECTED USAGE: $0 [directory]"

# ensure positional arguments are provided
if [[ -z $1 ]]; then
  echo "$USAGE" >&2
  exit 1
fi

# creating logs directory if it doesn't exist
if [[ ! -d "$HOME"/logs ]]; then
  mkdir -p ~/logs

  #verify write permissions to /logs
  if [[ ! -w "$HOME"/logs ]]; then
   echo "ERROR: CANNOT WRITE $HOME/logs" >&2
   exit 1
  fi
fi

# define logging function
logger() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') – $1" | tee -a "$LOGFILE"
}





# input validation for directory
if [[ -d "$DIRECTORY" ]]; then
  logger "Inputted directory = $DIRECTORY"
  
else
  logger "Could not find directory $DIRECTORY. Exiting"
  echo "$USAGE"
  exit 1
fi


# creating backups directory if it doesn't exist
if [[ ! -d "$HOME"/backups ]]; then
  logger "creating $HOME/backup directory"
  mkdir -p "$HOME"/backups
  #verify write permissions to /backups
  if [[ ! -w "$HOME"/backups ]]; then
   logger "ERROR: CANNOT WRITE $HOME/backups" >&2
   exit 1
  fi
else
  logger "backup directory exists"
fi


# store backups in timestamped folder under backup directory

if [[ ! -d "$BACKUP_DIRECTORY" ]]; then
  logger "Creating timestamped directory"
  mkdir -p "$BACKUP_DIRECTORY"
  #verify write permissions to /backups
    if [[ ! -w $BACKUP_DIRECTORY ]]; then
   logger "ERROR: CANNOT WRITE $BACKUP_DIRECTORY" >&2
   exit 1
  fi
else
  logger "timestamped directory exists"
  exit 1
fi


# copy contents of directory to backup directory
logger "COPYING CONTENTS FROM $DIRECTORY TO $BACKUP_DIRECTORY"
if cp -r "$DIRECTORY" "$BACKUP_DIRECTORY"; then 
  logger "BACKUP SUCCESSSFUL: $BACKUP_DIRECTORY"
else
  logger "ERROR: BACKUP COPY FAILED"
  exit 1
fi


#ensure proper permissions are set on backup directory

if chmod -R 770 "$BACKUP_DIRECTORY"; then 
  logger "Adjusted permissions for $BACKUP_DIRECTORY"
else
  logger "WARNING: Could not adjust file permissions for $BACKUP_DIRECTORY"
fi


logger "Backup script completed successfully"