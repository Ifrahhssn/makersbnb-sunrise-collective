require 'pg'

class Listing
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'sunrisebnb_test')
    else    
      connection = PG.connect(dbname: 'sunrisebnb')
    end

    result = connection.exec("SELECT * FROM listings;")
    result.map { |listing| listing['listing_name'] }
  end 
end