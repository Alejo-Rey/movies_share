module Movie
    class API < Grape::API
        version 'v1', using: :header, vendor: 'movie'
        format :json
        prefix :api

        resource :movies do
            desc 'Return all movies'
            get do
                Movies::Show.call() do |m|
                    m.success do |movies|
                        movies
                    end
                    m.failure do |message|
                        message
                    end
                end
            end

            desc 'Return Filter Movie'
            params do
                requires :id, type: Integer, desc: 'Identification'
            end
            get ':id' do
                Movies::ShowFilter.call(params: params) do |m|
                    m.success do |movies|
                        movies
                    end
                    m.failure do |message|
                        message
                    end
                end
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
            params do
                requires :id, type: Integer, desc: 'Identification'
                requires :name, type: String, desc: 'The name'
                requires :price, type: Integer, desc: 'The price'
            end
            put '/:id' do
                Movies::Update.call(params: params) do |m|
                    m.success do |movie|
                        movie
                    end
                    m.failure do |message|
                        message
                    end
                end
            end

            desc 'delete the movie'
            params do
                requires :id, type: Integer, desc: 'Identification'
            end
            delete '/:id' do
                Movies::Delete.call(params: params) do |m|
                    m.success do
                        status 204
                        "Deleted"
                    end
                    m.failure do |message|
                        error!({ error: message }, 404, { 'Content-Type' => 'text/error' })
                    end
                end
            end
        end
    end
end
