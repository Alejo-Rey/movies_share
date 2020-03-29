require 'sequel'

DB = Sequel.sqlite('database/development.sqlite3') # memory database, requires sqlite3

DB.create_table :movies do
    primary_key :id
    String :name
    Float :price
end

movies = DB[:movies]
