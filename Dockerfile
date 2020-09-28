FROM ruby:2.7.1-alpine AS base

RUN apk add --no-cache --update \
    bind-tools \
    build-base \
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
    PATH=/app/bin:$PATH

# Upgrade RubyGems and install required Bundler version
RUN gem update --system && \
    gem install bundler

###
# Development Image
###
FROM base AS development

RUN apk add --no-cache chromium chromium-chromedriver

ENV NODE_ENV=${NODE_ENV:-development} \
    RAILS_ENV=${RAILS_ENV:-development} \
    RACK_ENV=${RACK_ENV:-development}
# Create a directory for the app code
RUN mkdir -p /app
WORKDIR /app

###
# Production Image
###
FROM base AS production

ENV NODE_ENV=production \
    RAILS_ENV=production \
    RACK_ENV=production \
    REDIS_URL=${REDIS_URL} \
    DB_HOST=${DB_HOST} \
    DB_USER=${DB_USER} \
    PGPASSWORD=${PGPASSWORD} \
    DATABASE_URL=${DATABASE_URL} \
    RAILS_PORT=${PORT:-3000}

# Upgrade RubyGems and install required Bundler version
RUN gem update --system && \
    gem install bundler

# Create a directory for the app code
RUN mkdir -p /app
WORKDIR /app

# This allows us to only run bundle/yarn install when in production AND dependencies have changed
COPY Gemfile Gemfile.lock ./
COPY package.json yarn.lock ./

RUN bundle install & bundle_pid=$! && \
    yarn install --frozen-lockfile && \
    wait $bundle_pid

# The rest of the application code is added here so we don't re-install dependencies if not needed
COPY . .

RUN if [ $RAILS_ENV = 'production' ]; then webpack; fi

CMD rails server -p $RAILS_PORT -b 0.0.0.0
