require 'pg'
require_relative '../../lib/listing'

feature 'Shows listings' do 
  it 'shows all the listings on a page' do 
    Listing.create(listing_name: "Listing number 1", description: "Listing description", price: "50")

    visit('/listings')
    expect(page).to have_content "Listing number 1"
    expect(page).to have_content "Listing description"
    expect(page).to have_content "50"
  end 
end
