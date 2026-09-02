#!/bin/bash

VM="fedora"

state=$(virsh domstate "$VM" 2>&1)

case "$state" in

    "running")
        if output=$(virsh shutdown "$VM" 2>&1); then
            echo "VM '$VM' shutting down."
            exit 0
        else
            echo "$output"
            exit 1
        fi
        ;;

    "paused")
        if output=$(virsh shutdown "$VM" 2>&1); then
            echo "VM '$VM' shutting down."
            exit 0
        else
            echo "$output"
            exit 1
        fi
        ;;

    "shut off")
        echo "VM '$VM' is already stopped."
        exit 0
        ;;

    *)
        echo "Failed to determine the state of VM '$VM' (state: $state)"
        exit 1
        ;;

esac