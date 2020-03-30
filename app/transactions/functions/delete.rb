module Movies

    class Delete < BaseTransaction
        tee :params
        step :delete

        def params(input)
            @params = input.fetch(:params)
        end
        def delete(input)
            @movie = MovieModel.find(id: @params[:id])
            if @movie
                @movie.delete()
                Success()
            else
                Failure("Object not found")
            end
        end
    end
end