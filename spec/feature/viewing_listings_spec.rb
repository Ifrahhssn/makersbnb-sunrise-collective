feature 'Shows listings' do 
  it 'shows all the listings on a page' do 
    connection = PG.connect(dbname: 'sunrisebnb_test')
    connection.exec("INSERT INTO listings (listing_name) VALUES ('Listing number 1');")
    connection.exec("INSERT INTO listings (listing_name) VALUES ('Listing number 2');")
    connection.exec("INSERT INTO listings (listing_name) VALUES ('Listing number 3');")

    visit('/listings')
    expect(page).to have_content "Listings"
  end 
end
