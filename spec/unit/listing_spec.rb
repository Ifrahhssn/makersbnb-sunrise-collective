require 'listing'

describe Listing do
  describe '.all' do
    it "should show all listings" do 
      connection = PG.connect(dbname: 'sunrise_bnb_manager_test')
      connection.exec("INSERT INTO listings (listing_name, description, price) VALUES ('Listing number 1', 'Description 1', '50');")
      # connection.exec("INSERT INTO listings (listing_name) VALUES ('Listing number 2');")

      listings = Listing.all

      expect(listings.first.listing_name).to include "Listing number 1"
      expect(listings.first.description).to include "Description 1"
      expect(listings.first.price).to include "50"
      # expect(listings[1].listing_name).to include "Listing number 2"
    end 
  end

  describe '.create' do
    it 'creates a new listing' do
      first_input = Listing.create(listing_name: 'Example listing 1', description: 'Example description', price: '60')
      
  
      persisted_data = PG.connect(dbname: 'sunrise_bnb_manager_test').query("SELECT * FROM listings WHERE 
      id = #{first_input.id} ;")
  
      
      expect(first_input.id).to eq persisted_data.first['id']
      # expect(Listing.all).to include 'Example description'
      # expect(Listing.all).to include '60'
    end
  end
end
