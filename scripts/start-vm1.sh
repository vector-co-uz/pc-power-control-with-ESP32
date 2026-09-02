#!/bin/bash

VM="game"

state=$(virsh domstate "$VM" 2>&1)

case "$state" in

    "shut off")
        if output=$(virsh start "$VM" 2>&1); then
            echo "VM '$VM' started successfully."
            exit 0
        else
            echo "$output"
            exit 1
        fi
        ;;

    "paused")
        if output=$(virsh resume "$VM" 2>&1); then
            echo "VM '$VM' resumed."
            exit 0
        else
            echo "$output"
            exit 1
        fi
        ;;

    "running")
        echo "VM '$VM' is already running."
        exit 0
        ;;

    *)
        echo "Failed to determine the state of VM '$VM' (state: $state)"
        exit 1
        ;;

esac