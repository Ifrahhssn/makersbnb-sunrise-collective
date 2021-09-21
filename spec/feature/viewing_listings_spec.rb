require 'pg'

feature 'Shows listings' do 
  it 'shows all the listings on a page' do 
    Listing.create(listing_name: "Listing number 1")

    visit('/listings')
    expect(page).to have_content "Listing number 1"

  end 
end
