require 'sequel'
require 'grape'
require 'dry-transaction'
require 'byebug'
require 'env'

# DB = Sequel.connect('sqlite://database/development.sqlite3')
DB = Sequel.connect("postgres://#{ENV['USER_DB']}:#{ENV['USER_PASS_DB']}@#{ENV['HOST_DB']}:#{ENV['PORT_DB']}/#{ENV['NAME_DB']}")

Dir[File.join(__dir__, 'app/controllers', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'app/transactions', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'app/transactions/**', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'app/models', '*.rb')].each { |file| require file }

Movie::API.compile!
run Movie::API
