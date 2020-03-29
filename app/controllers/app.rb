module Movie
    class API < Grape::API
        version 'v1', using: :header, vendor: 'movie'
        format :json
        prefix :api

        resource :movies do
            desc 'Return all movies'
            get do
                movies = DB[:movies]
            end

            desc 'Create the movie'
            params do
                requires :name, type: String, desc: 'The name'
                requires :price, type: Integer, desc: 'The price'
            end
            post do
                Movies::Create.call(params: params) do |m|
                    m.success do |movie|
                        movie
                    end
                    m.failure do |message|
                        message
                    end
                end
            end

            desc 'Update the movie'
            put do
                'updated'
            end

            desc 'delete the movie'
            delete do
                'Deleted'
            end
        end
    end
end
