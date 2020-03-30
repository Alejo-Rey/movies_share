module Booking

    class Delete < BaseTransaction
        tee :params
        step :delete

        def params(input)
            @params = input.fetch(:params)
        end
        def delete(input)
            @booking = BookingModel.find(id: @params[:id])
            if @booking
                @booking.delete()
                Success()
            else
                Failure("Object not found")
            end
        end
    end
end