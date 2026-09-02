#!/bin/bash

VM="ubuntu"

if output=$(virsh reboot "$VM" 2>&1); then
    echo "VM_NAME=$VM"
    echo "STATUS=success"
    echo "MESSAGE=VM '$VM' is restarting."
    exit 0
else
    echo "VM_NAME=$VM"
    echo "STATUS=error"
    echo "MESSAGE=Failed to reboot VM '$VM'"
    echo "$output"
    exit 1
fi
