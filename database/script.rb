require 'sequel'

DB = Sequel.connect("postgres://#{ENV['USER_DB']}@#{ENV['HOST_DB']}:#{ENV['PORT_DB']}/#{ENV['NAME_DB']}")

DB.create_table :movies do
    primary_key :id
    String :name
    Float :price
end

movies = DB[:movies]
