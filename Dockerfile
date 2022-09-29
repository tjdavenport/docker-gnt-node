FROM node:18-alpine

RUN apk update && \
  apk add \
  bash \
  curl \
  github-cli \
  git  \
  neovim  \
  openssh \
  tmux

RUN adduser -D pro
WORKDIR /home/pro
COPY --chown=pro:pro ./docker-entrypoint.sh ./docker-entrypoint.sh
RUN chmod u+x ./docker-entrypoint.sh

USER pro

ENTRYPOINT /bin/bash docker-entrypoint.sh
