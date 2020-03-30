module Booking

    class Create < BaseTransaction
        tee :params
        step :create
        step :serialize

        def params(input)
            @params = input.fetch(:params)
        end
        def create(input)
            @booking = BookingModel.new(@params)
            @booking.save
            Success(@booking)
        end

        def serialize(input)
            Success(@booking.to_hash)
        end
    end
end
