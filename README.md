# API of booking movies with Grape

This project build the API from 0 using the framework Grape and the gem Dry Transaction [https://dry-rb.org/gems/dry-transaction/](https://dry-rb.org/gems/dry-transaction/), and the gem Sequel [https://github.com/jeremyevans/sequel](https://github.com/jeremyevans/sequel)\

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

You need to install the BD postgresql, follow this steps [http://zetcode.com/db/postgresqlruby/](http://zetcode.com/db/postgresqlruby/) and then create the database with the sript [database/script.sql](./database/script.sql)\

`git clone https://github.com/Alejo-Rey/movies_share.git`
.
`cd movies_share`

Then you need to sed the enviroments variables with the data of the database, only fill the USER_DB and USER_PASS_DB\
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







 ## Author
 * **Alejo-Rey** - [Alejo-Rey](https://github.com/Alejo-Rey)