FROM ruby:2.3.0-slim

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - libpq-dev: Communicate with postgres through the postgres gem
# - postgresql-client-9.4: In case you want to talk directly to postgres
RUN apt-get update && apt-get install -qq -y build-essential git nodejs libpq-dev postgresql-client-9.4 --fix-missing --no-install-recommends

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.

ENV app /app/
COPY Gemfile* .$app/
WORKDIR $app
ADD . $app
RUN bundle config github.https true && bundle config git.allow_insecure true && bundle install --jobs 4
# CMD rails s -b 0.0.0.0