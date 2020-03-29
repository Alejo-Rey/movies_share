module Movies

    class Update < BaseTransaction
        tee :params
        step :update
        step :serialize

        def params(input)
            @params = input.fetch(:params)
        end
        def update(input)
            @movie = MovieModel.find(id: @params[:id]).update(@params.except(:id))
            Success(@movie)
        end

        def serialize(input)
            Success(@movie.to_hash)
        end
    end
end