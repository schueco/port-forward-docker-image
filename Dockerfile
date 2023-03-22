FROM alpine:3.17.2

# LABEL org.opencontainers.image.source="https://github.com/schueco/port-forward-docker-image"
# LABEL org.opencontainers.image.description="This image uses `socat` to forward network traffic."
# LABEL org.opencontainers.image.licenses="MIT"

RUN apk add --update --no-cache socat \
	&& rm -rf /var/cache/apk/

RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup

USER 1001

ENV REMOTE_PORT=80
ENV LOCAL_PORT=8080
EXPOSE 8080

COPY entrypoint.sh .
ENTRYPOINT [ "./entrypoint.sh" ]
