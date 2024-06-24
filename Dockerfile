FROM node:18-alpine

USER root

RUN apk add --no-cache git python3 py3-pip make g++ build-base cairo-dev pango-dev chromium

ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Install Flowise globally
RUN npm install -g flowise

# Create a directory for persistent data
RUN mkdir -p /data/flowise

# Set the working directory
WORKDIR /data/flowise

# Set environment variables
ENV PORT=80
ENV DATABASE_PATH=/root/.flowise
ENV APIKEY_PATH=/root/.flowise
ENV SECRETKEY_PATH=/root/.flowise
ENV LOG_PATH=/root/.flowise/logs

# Expose the specified port
EXPOSE ${PORT}

# Start the application
CMD ["flowise", "start"]
