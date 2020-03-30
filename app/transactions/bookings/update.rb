module Booking

    class Update < BaseTransaction
        tee :params
        step :update
        step :serialize

        def params(input)
            @params = input.fetch(:params)
        end
        def update(input)
            @booking = BookingModel.find(id: @params[:id]).update(@params.except(:id))
            Success(@booking)
        end

        def serialize(input)
            Success(@booking.to_hash)
        end
    end
end