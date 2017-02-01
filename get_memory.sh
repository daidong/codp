#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 -d/--dir dir" >&2
  exit 1
fi

while [[ $# > 1 ]]
do
    params="$1"

    case $params in
        -d | --dir)
            dir=$2
            shift
            ;;
        *)
            ;;
    esac
    shift
done

host=`hostname`
echo $host
filename="$dir/$host.log"

while true;
do
    date >> $filename
    free -m >> $filename
    sleep 10
done
