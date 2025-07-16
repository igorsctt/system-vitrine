#!/bin/bash
set -e

yarn install
bundle install
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rake assets:precompile
bundle exec rake assets:clean
