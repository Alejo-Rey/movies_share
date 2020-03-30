class BookingModel < Sequel::Model(DB[:bookings])
    many_to_one :function_model, :key => :function_model_id
end