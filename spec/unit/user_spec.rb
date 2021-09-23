# remember include database helpers
require "User"

describe User do
  describe ".create" do
    it "should create a new user" do
      first_user = User.create(username: "John", password: "1234567", email: "test1@example.com")
      persisted_data = PG.connect(dbname: "sunrise_bnb_manager_test").query("SELECT * FROM accounts where user_id = #{first_user.user_id};")

      expect(first_user).to be_a User
      expect(first_user.user_id).to eq persisted_data.first["user_id"]
      expect(first_user.username).to eq "John"
      expect(first_user.password).to eq "1234567"
      expect(first_user.email).to eq "test1@example.com"
    end
  end

  describe ".authenticate" do
    it "should authenticate user" do
      first_user = User.create(username: "Mark", password: "1234567", email: "test2@example.com")

      authenticated_user = User.authenticate("test2@example.com", "1234567")

      p authenticated_user
      expect(authenticated_user.user_id).to eq first_user.user_id
    end
  end
end
