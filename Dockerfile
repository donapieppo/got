FROM ruby:2.3
MAINTAINER Donapieppo <donapieppo@yahoo.it>

ENV DEBIAN_FRONTEND noninteractive

ENV SECRET_KEY_BASE_GOT   verysecuresecretkeye71dedghqhjhjqhdhqhdhgwhqverysecureiamreally
ENV GOT_DATABASE_PASSWORD verysecuresecret

RUN apt-get update \
    && apt-get install -y -y --no-install-recommends sqlite3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

# configuration
RUN ["/bin/cp", "doc/dm_unibo_common_docker.yml", "config/dm_unibo_common.yml"]
RUN ["/bin/cp", "doc/got_example_docker.rb",      "config/initializers/got.rb"]
RUN ["/bin/cp", "doc/sqlite_database.yml",        "config/database.yml"]

# db
RUN ["rake", "db:create"]
RUN ["rake", "db:schema:load"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]



