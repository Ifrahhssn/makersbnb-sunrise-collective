require 'pg'

feature 'adding new listings' do
  scenario 'host can add a new listing' do
    visit('/listings/new')
    fill_in 'listing_name', with: 'Example listing 1'
    click_button ('Submit')
    expect(page).to have_content 'Example listing 1'
  end
end
