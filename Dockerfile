FROM node:20-alpine as builder

# Install required packages
RUN apk add --no-cache git curl jq

# Set working directory
WORKDIR /files

# Clone the repository
ARG REPO_URL=https://github.com/havaleiros/hassio-haval-h6-to-mqtt.git
ARG BRANCH=main
RUN git clone --depth 1 -b ${BRANCH} ${REPO_URL} /tmp/repo && \
    cp -r /tmp/repo/haval-h6-mqtt/* /files/ && \
    rm -rf /tmp/repo

FROM node:20-alpine as runner

WORKDIR /app

COPY --from=builder /files/ .

RUN npm ci --only=production

EXPOSE 3000

CMD ["node", "index.js"]