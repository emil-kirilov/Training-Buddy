class User < ActiveRecord::Base
  has_many :days

  has_secure_password
  validates :email, presence: true, uniqueness: { message: "This email is already used." } 

  def self.authenticate(email, password)
    user = User.find_by(email: email)

    return nil if user.nil?
    return user if user.password == password
  end
end