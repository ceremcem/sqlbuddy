#!/bin/bash 

PORT=$1
if [[ "$PORT" == "" ]]; then 
	PORT=7904
fi

echo "Server started on port $PORT"
firefox "localhost:$PORT"
php -S "127.0.0.1:$PORT"
