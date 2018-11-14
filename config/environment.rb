require 'bundler'
Bundler.require

Dotenv.load

# require_relative '../lib'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil

require_all 'lib'
