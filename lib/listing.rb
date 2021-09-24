require 'pg'

class Listing
  
  attr_reader :listing_name, :description, :price, :id 
  
  def initialize(id:, listing_name:, description:, price:)
    @listing_name = listing_name
    @description = description
    @price = price 
    @id = id
  end 
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'sunrise_bnb_manager_test')
    else    
      connection = PG.connect(dbname: 'sunrise_bnb_manager')
    end

    result = connection.exec("SELECT * FROM listings;")
    result.map do |listing| 
    Listing.new(id: listing['id'], listing_name: listing['listing_name'], description: listing['description'], price: listing['price'])
    end 
    #"#{listing['listing_name']} : #{listing['description']} : #{listing['price']} " }
    # ChitterFeed.new(id: input['id'], name: input['name'], message: input['message'], time: input['time'])
  end 
  
  


  def self.create(listing_name:, description:, price:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'sunrise_bnb_manager_test')
    else    
      connection = PG.connect(dbname: 'sunrise_bnb_manager')
    end
    result = connection.exec("INSERT INTO listings (listing_name, description, price) 
    VALUES('#{listing_name}', '#{description}', '#{price}') RETURNING id, listing_name, description, price;")
    Listing.new(id: result[0]['id'], listing_name: result[0]['listing_name'], description: result[0]['description'], price: result[0]['price'])
  end
end
