FROM debian:latest

ARG VERSION
ARG DEBIAN_FRONTEND=noninteractive

# Create group and user
RUN groupadd user \
 && useradd --create-home --gid user user \
 && mkdir /home/user/.fonts \
 && chown user:user /home/user/.fonts

RUN sed -i -e's/ main/ main contrib non-free/g' /etc/apt/sources.list \
 && apt-get update \
 && apt-get install --yes --no-install-recommends dumb-init fontconfig ttf-mscorefonts-installer fonts-open-sans chromium

USER user

COPY --chown=user:user entrypoint.sh /home/user/

ENTRYPOINT ["dumb-init", "--", "/bin/sh", "/home/user/entrypoint.sh"]
