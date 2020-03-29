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
            post do
                movies = DB[:movies]
                movies.insert(:name => 'Alejo', :price => 2)
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
