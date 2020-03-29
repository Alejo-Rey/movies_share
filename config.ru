require 'sequel'
require 'grape'

DB = Sequel.connect('sqlite://database/development.sqlite3')

Dir[File.join(__dir__, 'lib/views', '*.rb')].each { |file| require file }

Movie::API.compile!
run Movie::API
