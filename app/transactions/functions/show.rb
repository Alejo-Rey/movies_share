module Function

    class Show < BaseTransaction
        step :show
        step :serialize

        
        def show()
            @functions = FunctionModel.all()
            Success(@functions)
        end

        def serialize(input)
            array_functions = @functions.map {|function| function.to_hash}
            Success(array_functions)
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
            @functions = FunctionModel.where(movie_model_id: @params[:movie_model_id].to_i).all
            Success(@functions)
        end

        def serialize(input)
            array_functions = @functions.map {|function| function.to_hash}
            Success(array_functions)
        end
    end
end