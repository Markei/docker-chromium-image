#!/bin/sh

if [ "$(ls -A /home/user/.fonts/)" ]; then
  fc-cache -f -v
fi

chromium \
  --disable-client-side-phishing-detection \
  --disable-default-apps \
  --disable-dev-shm-usage \
  --disable-extensions \
  --disable-gpu \
  --disable-translate \
  --headless \
  --metrics-recording-only \
  --no-first-run \
  --no-sandbox \
  --mute-audio \
  --safebrowsing-disable-auto-update \
  --user-data-dir=/home/user/ \
  "$@"

