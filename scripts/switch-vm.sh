#!/bin/bash

VM1="game"
VM2="ubuntu"

TIMEOUT=120


wait_shutdown() {
    local VM="$1"
    local ELAPSED=0

    echo "Waiting for $VM to shut down (maximum ${TIMEOUT} seconds)..."

    while [ $ELAPSED -lt $TIMEOUT ]; do

        STATE=$(virsh domstate "$VM" 2>/dev/null | xargs)

        if [[ "$STATE" == "shut off" ]]; then
            echo "$VM shut down after ${ELAPSED} seconds."
            return 0
        fi

        echo "$VM state: $STATE, elapsed ${ELAPSED}/${TIMEOUT} seconds."

        sleep 2
        ELAPSED=$((ELAPSED+2))
    done


    echo "$VM did not shut down within ${TIMEOUT} seconds."
    echo "Forced shutdown of $VM..."

    virsh destroy "$VM"

    sleep 3


    STATE=$(virsh domstate "$VM" 2>/dev/null | xargs)

    if [[ "$STATE" == "shut off" ]]; then
        echo "$VM forced shutdown."
        return 0
    fi


    echo "Error: $VM is still running!"
    return 1
}



VM1_STATE=$(virsh domstate "$VM1" 2>/dev/null | xargs)
VM2_STATE=$(virsh domstate "$VM2" 2>/dev/null | xargs)


echo "$VM1: $VM1_STATE"
echo "$VM2: $VM2_STATE"



# Обе выключены
if [[ "$VM1_STATE" == "shut off" && "$VM2_STATE" == "shut off" ]]; then
    echo "Both VMs are shut off. Nothing to do."
    exit 0
fi



# Обе включены
if [[ "$VM1_STATE" == "running" && "$VM2_STATE" == "running" ]]; then
    echo "Both VMs are running. Nothing to do."
    exit 0
fi



# Game -> Ubuntu
if [[ "$VM1_STATE" == "running" && "$VM2_STATE" == "shut off" ]]; then

    echo "Switching $VM1 -> $VM2"

    virsh shutdown "$VM1"


    if wait_shutdown "$VM1"; then

        echo "Waiting for devices to be released..."
        sleep 5

        echo "Starting $VM2..."
        virsh start "$VM2"

    else
        echo "Failed to shut down $VM1"
        exit 1
    fi

    exit 0
fi




# Ubuntu -> Game
if [[ "$VM2_STATE" == "running" && "$VM1_STATE" == "shut off" ]]; then

    echo "Switching $VM2 -> $VM1"

    virsh shutdown "$VM2"


    if wait_shutdown "$VM2"; then

        echo "Waiting for devices to be released..."
        sleep 5

        echo "Starting $VM1..."
        virsh start "$VM1"

    else
        echo "Failed to shut down $VM2"
        exit 1
    fi

    exit 0
fi



echo "Unknown VM state."
exit 1