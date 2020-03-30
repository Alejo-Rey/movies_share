module Booking

    class Create < BaseTransaction
        tee :params
        step :validate
        step :create
        step :serialize

        def params(input)
            @params = input.fetch(:params)
        end
        def validate
            @bookings = BookingModel.where(:function_model_id => @params[:function_model_id]).all
            @reserved = @bookings.length >= 9 ? true : false
            if @bookings.length >= 10
                Failure({"error": "10 bookings already exist"})
            else
                Success(@params)
            end
        end
        def create(input)
            @booking = BookingModel.new(@params)
            @booking.save
            @booking.function_model.update(:reserved => true) if @reserved
            Success(@booking)
        end

        def serialize(input)
            Success(@booking.to_hash)
        end
    end
end
