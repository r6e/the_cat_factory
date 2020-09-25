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

# Default environment to 'production' to fail-closed if the ENV gets meesed up in production
ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3 \
  NODE_ENV=${NODE_ENV:-production} \
  RAILS_ENV=${RAILS_ENV:-production} \
  RACK_ENV=${RACK_ENV:-production} \
  REDIS_URL=${REDIS_URL} \
  DATABASE_URL=${DATABASE_URL} \
  RAILS_PORT=${PORT:-3000} \
  PATH=/app/bin:$PATH

# Upgrade RubyGems and install required Bundler version
RUN gem update --system && \
    gem install bundler

# Create a directory for the app code
RUN mkdir -p /app

# Production-related. The COPY slows down our development deploys, but there's currently no way to
# conditionally COPY yet
COPY . /app
RUN if [ $RAILS_ENV = 'production' ]; then \
      bundle install && \
      yarn install --frozen-lockfile && \
      rails assets:precompile; \
    fi

WORKDIR /app

CMD rails server -p $RAILS_PORT -b 0.0.0.0
