#!/bin/bash

VM="fedora"

state=$(virsh domstate "$VM" 2>&1)

case "$state" in

    "running")
        echo "running"
        exit 0
        ;;

    "paused")
        echo "paused"
        exit 0
        ;;

    "shut off")
        echo "off"
        exit 0
        ;;

    *)
        echo "unknown: $state"
        exit 1
        ;;

esac
