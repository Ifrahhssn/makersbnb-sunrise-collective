require 'pg'

def setup_test_database

p "Setting up test database..."

connection = PG.connect(dbname: 'sunrise_bnb_manager_test')

# Clear the tables

connection.exec("TRUNCATE accounts;")
  
connection.exec("TRUNCATE listings;")  

end
