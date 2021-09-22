feature 'Shows index page' do 
  it 'loads the index page properly' do
    visit('/')
    expect(page).to have_content "Welcome"
  end 
end
