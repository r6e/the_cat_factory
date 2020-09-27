FROM ruby:2.7.1-alpine

RUN apk add --no-cache --update \
    bind-tools \
    build-base \
    chromium chromium-chromedriver \
    imagemagick \
    less \
    libxml2 \
    libxslt \
    linux-headers \
    postgresql-client postgresql-dev \
    tzdata \
    yarn

ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    PATH=/app/bin:$PATH \
    NODE_ENV=${NODE_ENV:-development} \
    RAILS_ENV=${RAILS_ENV:-development} \
    RACK_ENV=${RACK_ENV:-development}

# Upgrade RubyGems and install required Bundler version
RUN gem update --system && \
    gem install bundler

# Create a directory for the app code
RUN mkdir -p /app
WORKDIR /app
