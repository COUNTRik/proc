#!/bin/bash

echo "PID PPID STAT NAME" | awk '{print "%6s %-6s %10s %-20s\n", "  " $1, $2, $3, $4}'

for path in /proc/[0-9]*
do
stat=$(head -n 7 $path/status | tr -s [:space:])
cmd=$(cat $path/cmdline)
echo $stat $cmd | awk '{printf "%6s %-6s %10s %-20s\n", $13, $15 ,$6 "" $7, $2}'
done
