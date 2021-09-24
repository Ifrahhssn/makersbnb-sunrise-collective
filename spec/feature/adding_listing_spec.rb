require 'pg'

feature 'adding new listings' do
  scenario 'host can add a new listing' do
    visit('/listings/new')
    fill_in 'listing_name', with: 'Example listing 1'
    click_button ('Submit')
    expect(page).to have_content 'Example listing 1'
  end

  scenario 'host can add short description and price per night to new listing' do
    visit('/listings/new')
    fill_in 'description', with: 'Example description'
    fill_in 'price', with: '60'
    click_button ('Submit')
    expect(page).to have_content 'Example description'
    expect(page).to have_content '60'
  end
end
