require 'pg'

class User
  def self.test
    connection = PG.connect(dbname: 'sunrise_bnb_manager')
    result = connection.exec('SELECT * FROM accounts')
    result.map { |input| input['email'] } 
  end 
end
 
