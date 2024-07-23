#!/bin/bash

# Configuration
SOURCE_DIR="/path/to/source/directory/"  
DEST_DIR="/path/to/destination/directory/"  
REMOTE_HOST="your.remote.host"  
REMOTE_USER="your_remote_user"  
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="backup_log_$TIMESTAMP.txt"
EMAIL_TO="your_email@example.com"  

# Run rsync and capture the output
rsync -avz --delete "$SOURCE_DIR" "$REMOTE_USER@$REMOTE_HOST:$DEST_DIR" > "$LOG_FILE" 2>&1

# Check if rsync was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
    echo "Backup log saved to $LOG_FILE"
    SUCCESS_MESSAGE="Backup completed successfully on $TIMESTAMP."
else
    echo "Backup failed."
    echo "Check the log file for details: $LOG_FILE"
    SUCCESS_MESSAGE="Backup failed on $TIMESTAMP. Check the log file for details: $LOG_FILE"
fi

# Email notification
mail -s "Backup Report" "$EMAIL_TO" < "$LOG_FILE"
