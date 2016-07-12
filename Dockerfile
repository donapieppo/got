FROM ruby:2.3

RUN apt-get update \
    && apt-get install -y --no-install-recommends sqlite3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

# configuration
RUN ["/bin/cp", "doc/dm_unibo_common.yml", "config"]
RUN ["/bin/cp", "doc/got_example.rb",      "config/initializers/got.rb"]
RUN ["/bin/cp", "doc/sqlite_database.yml", "config/database.yml"]

ENV SECRET_KEY_BASE_GOT verysecuresecretkeye71dedghqhjhjqhdhqhdhgwhqverysecureiamreally
ENV DEVISE_SECRET_KEY   verysecuresecretkeyverysecuresecretkeyverysecuresecretkeyverysecuresecretkeyverysecuresecretkey

# db
CMD ["bin/rake", "db:create"]
CMD ["bin/rake", "db:schema:load"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]



