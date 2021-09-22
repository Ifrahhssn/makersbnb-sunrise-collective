require "pg"

class User
  attr_reader :username, :user_id, :email, :password

  def initialize(user_id:, username:, email:, password:, created_on:, last_login:)
    @user_id = user_id
    @username = username
    @email = email
    @password = password
  end

  def self.create(email:, username:, password:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "sunrise_bnb_manager_test")
    else
      connection = PG.connect(dbname: "sunrise_bnb_manager")
    end

    result = connection.exec("INSERT INTO accounts (username, email,  password, created_on, last_login)
    VALUES('#{username}','#{email}','#{password}', NOW(), NOW()) RETURNING user_id, username, 
    email, password, created_on, last_login;")

    User.new(user_id: result[0]["user_id"], username: result[0]["username"],
             email: result[0]["email"], password: result[0]["password"],
             created_on: result[0]["created_on"], last_login: result[0]["last_login"])
  end

  def self.test
    connection = PG.connect(dbname: "sunrise_bnb_manager")
    result = connection.exec("SELECT * FROM accounts")
    result.map { |input| input["email"] }
  end



end
