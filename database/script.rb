require 'sequel'
DB = Sequel.connect("postgres://#{ENV['USER_DB']}:#{ENV['USER_PASS_DB']}@#{ENV['HOST_DB']}:#{ENV['PORT_DB']}/#{ENV['NAME_DB']}")
unless DB.table_exists?(:movies)
    DB.create_table :movies do
        primary_key :id
        String :name
        String :description
        String :url_img
    end
end
unless DB.table_exists?(:functions)
    DB.create_table :functions do
        primary_key :id
        Time :date_movie
        foreign_key :movie_model_id
	    Integer :day_of_week
	    Boolean :reserved, default:false 
    end
end
unless DB.table_exists?(:bookings)
    DB.create_table :bookings do
        primary_key :id
        foreign_key :function_model_id
    end
end
movies = DB[:movies]
functions = DB[:functions]
bookings = DB[:bookings]
