#!/bin/bash
VM="fedora"

if output=$(virsh destroy "$VM" 2>&1); then
    echo "VM_NAME=$VM"
    echo "STATUS=success"
    echo "MESSAGE=VM '$VM' forcefully stopped."
    exit 0
else
    echo "VM_NAME=$VM"
    echo "STATUS=error"
    echo "MESSAGE=$output"
    exit 1
fi