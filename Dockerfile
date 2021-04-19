FROM ruby:2.6.5

RUN apt-get update -qq && \
    apt-get install -y build-essential \        
    nodejs \
    libpq-dev 
          


WORKDIR /hondaapp

COPY Gemfile /hondaapp/Gemfile
COPY Gemfile.lock /hondaapp/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN mkdir -p tmp/sockets
