feature 'registration' do
  scenario 'user can sign up' do

    visit '/users/new'
    fill_in('username', with: 'Example')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: '12345678')
    click_button('Submit')

    expect(page).to have_content 'Hello Example, Welcome to sunrise bnb'

  end
end