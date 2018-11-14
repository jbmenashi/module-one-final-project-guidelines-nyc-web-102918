require 'bundler'
Bundler.require

Dotenv.load

# require_relative '../lib'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
