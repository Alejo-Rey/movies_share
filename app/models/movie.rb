class MovieModel < Sequel::Model(DB[:movies])
    one_to_many :function_model
end