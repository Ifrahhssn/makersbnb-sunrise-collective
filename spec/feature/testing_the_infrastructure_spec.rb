feature 'Shows index page' do 
    it 'loads the index page properly' do
        visit('/')
        expect(page).to have_content "Sunrise Bookings!"
    end 
end 

feature 'Shows listings' do 
    it 'shows all the listings on a page' do 
    visit('/listings')
    expect(page).to have_content "Listings"
  end 
end 