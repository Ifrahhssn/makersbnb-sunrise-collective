require 'pg'

class Listing
  def self.all
    connection = PG.connect(dbname: 'sunrisebnb')
    result = connection.exec("SELECT * FROM listings;")
    result.map { |listing| listing['listing_name'] }
  end 
end
