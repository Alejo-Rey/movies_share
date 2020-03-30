# API of booking movies with Grape

This project build the API from 0 using the framework Grape and the gem Dry Transaction [https://dry-rb.org/gems/dry-transaction/](https://dry-rb.org/gems/dry-transaction/), and the gem Sequel [https://github.com/jeremyevans/sequel](https://github.com/jeremyevans/sequel)

-----
## Structure

    * app
        * controllers
            * app.rb
        * models
            * booking.rb
            * function.rb
            * movie.rb
        * transactions
            * bookings
                - CRUD
            * functions
                - CRUD  
            * movies
                - CRUD
            * base_transaction.rb
    * database
        * script.rb
    * spec
        * movies_test.rb
        * functions_test.rb
        * bookings_test.rb
    * config.rb
    * Gemfile

## Controllers

Resource 	   | HTTP Verb       |
--------------- | --------------- |
movies | GET, POST, PUT, DELETE |
bookings | GET, POST, PUT, DELETE |
functions | GET, POST, PUT, DELETE |

## How to run it

You need to install the BD postgresql, follow this steps [http://zetcode.com/db/postgresqlruby/](http://zetcode.com/db/postgresqlruby/) and then create the database with the sript [database/script.sql](./database/script.sql)

`git clone https://github.com/Alejo-Rey/movies_share.git`\

`cd movies_share`

Then you need to sed the enviroments variables with the data of the database, only fill the USER_DB and USER_PASS_DB
- export USER_DB=
- export USER_PASS_DB=
- export HOST_DB=localhost
- export PORT_DB=5432
- export NAME_DB=development

After set the variables you have to run the script of sequel\
`ruby database/script.rb`

Then up the services.\
`rackup`

## Endpoints
You can test the endpoints sending the petitions to the deployment on https://moviesharealejo.herokuapp.com/api/

### /movies
`curl -X GET 'https://moviesharealejo.herokuapp.com/api/movies'`\
To show all the movies

`curl -X GET 'https://moviesharealejo.herokuapp.com/api/movies/1'`\
To show a filter movie

`curl -X POST 'https://moviesharealejo.herokuapp.com/api/movies' -H 'Content-Type: application/json' -d '{"name": "movie 3", "description": "description 3", "url_img": "url_image 3"}'`\
To create a movie

### /functions

`curl -X GET 'https://moviesharealejo.herokuapp.com/api/functions'`\
To get all the functions

`curl -X GET 'https://moviesharealejo.herokuapp.com/api/movies/1/functions'`\
To show all the functions of the movie 1

`curl -X POST 'https://moviesharealejo.herokuapp.com/api/functions' -H 'Content-Type: application/json' -d '{"movie_model_id": 1, "date_movie": "2020/03/30", "day_of_week": 1}'`\
TO create a function of one movie (you check the movie in movie_model_id)

### /bookings

`curl -X GET 'https://moviesharealejo.herokuapp.com/api/bookings'`\
To get all the bookings

`curl -X POST 'https://moviesharealejo.herokuapp.com/api/booking' -H 'Content-Type: application/json' -d '{"function_model_id": 2}'`\
To create a booking 



 ## Author
 * **Alejo-Rey** - [Alejo-Rey](https://github.com/Alejo-Rey)