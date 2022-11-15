#!/usr/bin/bash

# Concept of parallel jobs
echo "starting all jobs"

$(pwd)/parallel1.sh &
$(pwd)/parallel2.sh &

# Wait for all jobs to complete
wait

echo "All jobs done"
