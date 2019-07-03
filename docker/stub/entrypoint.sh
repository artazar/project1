#!/bin/bash

coproc read
pid=$!
trap 'echo signal recieved; kill -SIGTERM $pid' SIGINT SIGTERM

wait || exit 0
