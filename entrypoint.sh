#! /bin/sh
socat "tcp-listen:$LOCAL_PORT",reuseaddr,fork "tcp:$REMOTE_HOST:$REMOTE_PORT" &
pid=$! && trap 'kill $pid' INT
echo "Socat started listening on $LOCAL_PORT: Redirecting traffic to $REMOTE_HOST:$REMOTE_PORT ($pid)" && wait $pid
