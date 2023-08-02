FROM node:18-alpine

RUN npm install -g @mockoon/cli@3.1.0
COPY base-data.json ./base-data.json

# Install curl for healthcheck and tzdata for timezone support.
RUN apk --no-cache add curl tzdata

# Do not run as root.
RUN adduser --shell /bin/sh --disabled-password --gecos "" mockoon
RUN chown -R mockoon ./base-data.json
USER mockoon

EXPOSE 3000

ENTRYPOINT ["mockoon-cli", "start", "--daemon-off", "--disable-log-to-file", "--data", "base-data.json", "--container"]

# Usage: docker run -p <host_port>:<container_port> mockoon-test