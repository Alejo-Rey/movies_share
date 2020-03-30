class FunctionModel < Sequel::Model(DB[:functions])
    many_to_one :movie_model, :key => :movie_model_id
    one_to_many :booking_model
end