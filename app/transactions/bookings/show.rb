module Booking

    class Show < BaseTransaction
        step :show
        step :serialize

        def show()
            @bookings = BookingModel.all()
            Success(@bookings)
        end

        def serialize(input)
            array_bookings = @bookings.map {|booking| booking.to_hash}
            Success(array_bookings)
        end
    end
end