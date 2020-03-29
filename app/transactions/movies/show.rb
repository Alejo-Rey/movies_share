module Movies

    class Show < BaseTransaction
        step :show
        step :serialize

        def show()
            @movies = MovieModel.all()
            Success(@movies)
        end

        def serialize(input)
            array_movies = @movies.map {|movie| movie.to_hash}
            Success(array_movies)
        end
    end

    class ShowFilter < BaseTransaction
        tee :params
        step :showfilter
        step :serialize

        def params(input)
            @params = input.fetch(:params)
        end
        def showfilter(input)
            @movie = MovieModel.where(id: @params[:id])
            Success(@movie)
        end

        def serialize(input)
            Success(@movie[@params[:id]].to_hash)
        end
    end
end