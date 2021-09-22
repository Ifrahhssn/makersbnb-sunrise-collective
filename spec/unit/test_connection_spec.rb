require './lib/user'

describe User do
  describe '.test' do
  it 'returns a test user account' do
  user = User.test
  expect(user).to include "test@example.com"

  end   
end
end