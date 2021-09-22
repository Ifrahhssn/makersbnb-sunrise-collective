require 'listing'

describe Listing do
  describe '.all' do
    it "should show all listings" do 
      connection = PG.connect(dbname: 'sunrise_bnb_manager_test')
      connection.exec("INSERT INTO listings (listing_name) VALUES ('Listing number 1');")
      connection.exec("INSERT INTO listings (listing_name) VALUES ('Listing number 2');")

      listings = Listing.all
      expect(listings).to include "Listing number 1"
      expect(listings).to include "Listing number 2"
    end 
  end

  describe '.create' do
    it 'creates a new listing' do
      Listing.create(listing_name: 'Example listing 1', description: 'Example description', price: '60')
      expect(Listing.all).to include 'Example listing 1'
      expect(Listing.all).to include 'Example description'
      expect(Listing.all).to include '60'
    end
  end
end
