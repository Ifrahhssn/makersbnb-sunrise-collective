require 'listing'

describe Listing do
  it "should show all listings" do 
    connection = PG.connect(dbname: 'sunrisebnb_test')
    connection.exec("INSERT INTO listings (listing_name) VALUES ('Listing number 1');")
    connection.exec("INSERT INTO listings (listing_name) VALUES ('Listing number 2');")
    connection.exec("INSERT INTO listings (listing_name) VALUES ('Listing number 3');")

    listings = Listing.all
    expect(listings).to include "Listing number 1"
    expect(listings).to include "Listing number 2"
  end 
end
