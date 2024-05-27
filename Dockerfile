# syntax=docker/dockerfile:1.4
FROM --platform=$BUILDPLATFORM php:8.3.7-cli-alpine AS base

ARG VERSION

RUN <<EOT
  curl -f -o /usr/bin/phar-composer -LO "https://github.com/clue/phar-composer/releases/download/v${VERSION}/phar-composer-${VERSION}.phar"
  chmod +x /usr/bin/phar-composer
  echo 'phar.readonly=off' > $(php-config --ini-dir)/phar.ini
EOT

ENTRYPOINT ["/usr/bin/phar-composer"]
CMD []
