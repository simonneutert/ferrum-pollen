FROM ruby:3-alpine

WORKDIR /app

RUN apk update && \
  apk add --no-cache \
    build-base \
    chromium \
    make && \
  rm -rf /var/cache/apk/*

COPY Gemfile* ./
RUN bundle install

COPY . .

CMD ["ruby", "./pollen.rb"]
