# Non-root port forwarding for Docker

Based on [ministryofjustice/cloud-platform-port-forward-docker-image](https://github.com/ministryofjustice/cloud-platform-port-forward-docker-image)

This image uses `socat` to forward network traffic as defined by the environment variables.

It runs as a non-root user, which limits the attack surface.

## Usage

Define the following environment variables to configure port-forwarding.

Variable | Description | Optional
-------- | ----------- | --------
REMOTE_HOST | IP or address of the host you want to forward traffic to | no
REMOTE_PORT | Port on remote host to forward traffic to | yes (80)
LOCAL_PORT | Port where container listens. Must be **non-privileged** (i.e. >1024) | yes (8080)

```bash
docker run -e REMOTE_HOST=<remote_host> -e REMOTE_PORT=<remote_port> -e LOCAL_PORT=<local_port> -p <exposed_local_port>:<local_port> ghcr.io/schueco/port-forward
```

## Examples

The following command will forward all traffic from the remote port `80` on the remote host `www.example.com` to port `8080` on `localhost`:

```bash
docker run -e REMOTE_HOST=www.example.com -e REMOTE_PORT=80 -e LOCAL_PORT=8080 -p 8080:8080 ghcr.io/schueco/port-forward
```
