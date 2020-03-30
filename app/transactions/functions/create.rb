module Function

    class Create < BaseTransaction
        tee :params
        step :create
        step :serialize

        def params(input)
            @params = input.fetch(:params)
        end
        def create(input)
            @function = FunctionModel.new(@params)
            @function.save
            Success(@function)
        end

        def serialize(input)
            Success(@function.to_hash)
        end
    end
end
