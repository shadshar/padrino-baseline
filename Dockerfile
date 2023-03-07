FROM ruby:3.2-slim

RUN apt-get update && apt-get upgrade
RUN apt-get -y install --no-install-recommends gcc g++ make libpq-dev

COPY Gemfile .
COPY Gemfile.lock .
RUN gem install bundler
RUN bundle install && bundle binstubs --all

RUN apt-get -y remove gcc g++ make && apt-get -y autoremove
RUN apt-get -y clean
