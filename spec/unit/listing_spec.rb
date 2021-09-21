require 'listing'

describe Listing do
  it "should show all listings" do 
    listings = Listing.all
    expect(listings).to include "Listing number 1"
    expect(listings).to include "Listing number 2"
  end 
end
