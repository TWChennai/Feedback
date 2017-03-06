#!/bin/bash

function start {
    echo "Starting mountebank"
    echo $PWD
    cmd="./node_modules/mountebank/bin/mb --configfile ./FeedbackUITests/resources/imposters/backend.ejs --allowInjection"
    $cmd </dev/null &>/dev/null &
    RETVAL=$?
    if [ $RETVAL -eq 0 ]; then 
        echo "Started.."
    else
        echo "Error during startup.."
    fi
}   

function stop {
    echo "Stopping mountebank"
    pgrep -f mountebank | xargs kill
    RETVAL=$?
    if [ $RETVAL -eq 0 ]; then 
        echo "Stopped.."
    else
        echo "Error during shutdown.."
    fi
}

function status {
    pgrep -f mountebank >> /dev/null && echo "Running"
    pgrep -f mountebank >> /dev/null || echo "Not Running"
}

case "$1" in
    start|stop|status)
        $1
        ;;
    *)
        echo "Usage:
        server [stop|start|status] "
        exit 2
esac
