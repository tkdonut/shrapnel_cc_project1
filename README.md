# Shrapnel
## CodeClan Project 1 (Solo) 

A CRUD App with persistant data storage, which allows a user to track their spending. It allows for categorisation of transactions via tags and vendors, and allows you to associate budgets with a given tag. 

## Getting Started

A local installation of PostgreSQL must be present, with a database named 'shrapnel'. The schema of this database can be found in the 'db' folder and initialised with `psql -d shrapnel -f shrapnel.sql`

Sample data can be seeded into the database by running the 'transaction_seed.rb file.

Finally the app can be started by running the `app.rb` file in the root folder.

### Prerequisites

The following gems must be installed in order to run the main app.

  -sinatra
  -sinatra-contrib
  -pry

In order to run the unit test files in the specs folder, these additional gems must be installed

*minitest
*minitest-rg

## Built With

Ruby (Sinatra framework)
PostgreSQL
## Author

Thomas Kendrick

## Acknowledgments

Thanks to help from all of the instructors at CodeClan Edinburgh for making this project possible.
