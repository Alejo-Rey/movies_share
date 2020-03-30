describe Movie::API, type: :api do

    context 'GET /api/movies' do
        it 'return 200' do
            get '/api/movies'
            expect(last_response.status).to eq(200)
        end
    end
    context 'POST /api/movies' do
        it 'return 201' do
            call_api({:name => "1111111111", :price => 2})
            expect(last_response.status).to eq(201)
        end
    end
end