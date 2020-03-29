module Movies

    class Create < BaseTransaction
        tee :params
        step :create
        step :serialize

        def params(input)
            @params = input.fetch(:params)
        end
        def create(input)
            @movie = MovieModel.new(@params)
            @movie.save
            Success(@movie)
        end

        def serialize(input)
            Success(@movie.to_hash)
        end
    end
end
