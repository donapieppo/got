source 'https://rubygems.org'

gem 'sqlite3'

#gem 'dm_unibo_common', path: '/home/rails/gems/dm_unibo_common/'
gem 'dm_unibo_common',      git: 'https://github.com/donapieppo/dm_unibo_common.git',      ref: 'master', branch: 'master'
gem 'dm_unibo_user_search', git: 'https://github.com/donapieppo/dm_unibo_user_search.git', ref: 'master', branch: 'master'

gem "prawn"
gem "prawn-table"

gem 'mini_racer'
gem 'sdoc', '~> 0.4.0', group: :doc

# gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'spring'
end

