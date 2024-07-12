#!/bin/bash

case "$1" in
    --date | -d)
        echo "Today's date is $(date)"
        ;;
    --logs | -l)
        if [ -z "$2" ]; then
            echo "Creating 100 log files..."
            for (( i=1; i<=100; i++ ))
            do
                echo "Log $i created by skrypt.sh on $(date)" > "log$i.txt"
            done
        else
            num_logs=$2
            echo "Creating $num_logs log files..."
            for (( i=1; i<=$num_logs; i++ ))
            do
                echo "Log $i created by skrypt.sh on $(date)" > "log$i.txt"
            done
        fi
        ;;
    --help | -h)
        echo "Usage: skrypt.sh [OPTION]"
        echo "--date, -d      Display today's date"
        echo "--logs [N], -l  Create N log files (default 100)"
        ;;
    --init)
        echo "Cloning repository and setting PATH..."
        git clone https://github.com/gawron7/lab4-git-basics.git
        export PATH=$PATH:$(pwd)/lab4-git-basics
        ;;
    --error | -e)
        if [ -z "$2" ]; then
            echo "Creating 100 error files..."
            for (( i=1; i<=100; i++ ))
            do
                echo "Error $i created by skrypt.sh on $(date)" > "error$i.txt"
            done
        else
            num_errors=$2
            echo "Creating $num_errors error files..."
            for (( i=1; i<=$num_errors; i++ ))
            do
                echo "Error $i created by skrypt.sh on $(date)" > "error$i.txt"
            done
        fi
        ;;
    *)
        echo "Invalid option. Use '--help' for usage instructions."
        ;;
esac
