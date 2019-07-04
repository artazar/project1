#!/bin/bash

function check_port_availability() {
        docker exec $(docker ps --filter name=$1 -q -a) bash -c "echo > /dev/tcp/127.0.0.1/$2"
        return $?
}

function check_logs_for_ready_status {
        docker logs $(docker ps --filter name=$1 -q -a) 2>&1 | grep -m1 "$2" > /dev/null
        return $?
}

function retry_wrapper() {
        RETRIES=50
        while [ $RETRIES != 0 ];
        do
            echo "$1: $3: checking, $((RETRIES--)) remaining attempts..."
            $3 $1 "$2"
            if [ $? == 0 ];then
              echo "$1 is responding to $3, exiting"
              return 0
            fi
            sleep 2
        done

        echo "$1 is not responding to $3, timing out"
        return 1
}

retry_wrapper "db" "3306" check_port_availability && \
retry_wrapper "db" "ready for connections" "check_logs_for_ready_status" && \
retry_wrapper "wordpress" "ready to handle connections" "check_logs_for_ready_status" && \
retry_wrapper "nginx" "80" "check_port_availability"
