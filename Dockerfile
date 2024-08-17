FROM ruby:3.2.2

# Environment dependencies and tools to be installed
RUN apt-get update -qq && apt-get install -y nodejs yarn libmariadb-dev-compat libmariadb-dev

WORKDIR /Rails-Only

# Script responsible for avoiding database connection error and allowing the database to start correctly
COPY wait-for-it.sh /Rails-Only/wait-for-it.sh
RUN chmod +x /Rails-Only/wait-for-it.sh

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"]
