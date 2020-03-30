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
            segment '/:movie_model_id' do
                resource :functions do
                    
                    desc 'Return all Functions'
                    get do
                        Function::ShowFilter.call(params: params) do |m|
                            m.success do |function|
                                function
                            end
                            m.failure do |message|
                                message
                            end
                        end
                    end
                end
            end
        end

        resource :bookings do

            desc 'Return all bookins'
            get do
                Booking::Show.call() do |m|
                    m.success do |booking|
                        booking
                    end
                    m.failure do |message|
                        message
                    end
                end
            end

            desc 'Create a Booking'
            params do
                requires :function_model_id, type: Integer, desc: 'The identification function'
            end
            post do
                Booking::Create.call(params: params) do |m|
                    m.success do |booking|
                        booking
                    end
                    m.failure do |message|
                        message
                    end
                end
            end

            desc 'Modify the booking'
            params do
                requires :id, type: Integer, desc: 'Identification'
            end
            put '/:id' do
                Booking::Update.call(params: params) do |m|
                    m.success do |booking|
                        booking
                    end
                    m.failure do |message|
                        message
                    end
                end
            end

            desc 'Delete de Booking'
            params do
                requires :id, type: Integer, desc: 'Identification'
            end
            delete '/:id' do
                Booking::Delete.call(params: params) do |m|
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

        resource :functions do
            desc 'Return all Functions'
            get do
                Function::Show.call() do |m|
                    m.success do |function|
                        function
                    end
                    m.failure do |message|
                        message
                    end
                end
            end
            desc 'Create a Function'
            params do
                requires :movie_model_id, type: Integer, desc: 'The movie identification'
                requires :date_movie, type: Time, desc: 'The function date'
                requires :day_of_week, type: Integer
            end
            post do
                Function::Create.call(params: params) do |m|
                    m.success do |function|
                        function
                    end
                    m.failure do |message|
                        message
                    end
                end
            end
        end
    end
end
