FROM ruby:2.7.1-alpine

RUN apk add --no-cache --update \
    bind-tools \
    build-base \
    chromium chromium-chromedriver \
    less \
    libxml2 \
    libxslt \
    linux-headers \
    postgresql-client postgresql-dev \
    tzdata \
    yarn

# Configure bundler
ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

# Uncomment this line if you want to run binstubs without prefixing with `bin/` or `bundle exec`
ENV PATH /app/bin:$PATH

# Upgrade RubyGems and install required Bundler version
RUN gem update --system && \
    gem install bundler

# Create a directory for the app code
RUN mkdir -p /app

WORKDIR /app
