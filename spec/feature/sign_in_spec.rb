feature "authentication" do
  scenario "user can sign in" do
    User.create(username: "John", password: "1234567", email: "test1@example.com")
    visit '/sessions/new'
    fill_in('email', with: 'test1@example.com')
    fill_in('password', with: '1234567')
    click_button('Sign in')
    expect(page).to have_content "Welcome, John"
  end
end
