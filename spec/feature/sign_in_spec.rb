feature "authentication" do
  scenario "user can sign in" do
    User.create(username: "John", password: "1234567", email: "test1@example.com")
    visit '/sessions/new'
    fill_in('email', with: 'test1@example.com')
    fill_in('password', with: '1234567')
    click_button('Sign in')
    expect(page).to have_content "Hello John, Welcome to sunrise bnb"
  end

  scenario "user can sign out" do
    User.create(username: "John", password: "1234567", email: "test1@example.com")
    visit '/sessions/new'
    fill_in('email', with: 'test1@example.com')
    fill_in('password', with: '1234567')
    click_button('Sign in')
    click_link('Sign out')
    expect(page).to have_content "Welcome to Sunrise BnB"
    expect(page).not_to have_content "Hello John, Welcome to sunrise bnb"
  end
end
