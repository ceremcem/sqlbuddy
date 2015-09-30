#!/bin/bash 

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

PORT=$1
if [[ "$PORT" == "" ]]; then 
	PORT=7904
fi

echo "Server started on port $PORT"
firefox "localhost:$PORT"
php -S "127.0.0.1:$PORT" -t "$DIR"
