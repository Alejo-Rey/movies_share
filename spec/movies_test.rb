require 'sequel'
require 'grape'
require 'dry-transaction'
require 'env'
require 'byebug'
require 'rspec'
require 'rspec-grape'

# DB = Sequel.connect('sqlite://database/development.sqlite3')
DB = Sequel.connect("postgres://#{ENV['USER_DB']}:#{ENV['USER_PASS_DB']}@#{ENV['HOST_DB']}:#{ENV['PORT_DB']}/#{ENV['NAME_DB']}")

Dir[File.join(__dir__, '../app/controllers', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, '../app/transactions', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, '../app/transactions/**', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, '../app/models', '*.rb')].each { |file| require file }


describe Movie::API, type: :api do
    #include Rack::Test::Methods

    context 'GET /api/movies' do
        it 'return 200' do
            get '/api/movies'
            expect(last_response.status).to eq(200)
        end
    end
end