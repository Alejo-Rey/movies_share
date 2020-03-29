require 'sequel'
require 'grape'
require 'dry-transaction'
require 'byebug'

DB = Sequel.connect('sqlite://database/development.sqlite3')

Dir[File.join(__dir__, 'app/controllers', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'app/transactions', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'app/transactions/**', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'app/models', '*.rb')].each { |file| require file }

Movie::API.compile!
run Movie::API
