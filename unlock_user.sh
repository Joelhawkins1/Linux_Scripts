#!/bin/bash

# 1. Ask for the username
read -p "Enter the username to check: " TARGET_USER

# 2. Check if the user is currently lcoked
# 'passwd -S' Shaws status. 'L' indicated locked.
STATUS=$(passwd -S "$TARGET_USER" | awk '{print $2}')

if[[ "$STATUS" =~ L ]]; then
        echo "Account for $TARGET_USER is currently LOCKED!!"

        #3 Ask for confirmation to unlock
        read -p "would yu like to unlock this account (y/n): " CHOICE

        if [ "$CHOICE" == "y" ]; then
           passwd -u "$TARGET_USER"
           echo "SUCCER: $TAEGT_USER has been unlcoked."
        else
           echo "Action cancelled."
        fi
else
  echo "Account for $TAEGT_USER is already UNLOCKED or does not exist."
fi

