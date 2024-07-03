#!/bin/bash

stop_containers() {
    local containers=$(docker ps -q)
    if [ -z "$containers" ]; then
        echo "No active containers to stop."
        return
    fi

    echo "Stopping the following containers:"
    docker ps

    # Confirmation prompt
    read -p "Are you sure you want to stop all containers? (y/N) " confirm
    if [[ $confirm =~ ^[Yy]$ ]]; then
        docker stop $containers && log "All containers have been stopped."
    else
        echo "Operation cancelled."
    fi
}


echo "Stopping containers script"
stop_containers
