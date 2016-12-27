class User < ActiveRecord::Base
  has_many :days
  has_many :foods

  has_secure_password
  #, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :email, presence: true, uniqueness: { message: "This email is already used." }
  validates :admin, presence: true
  
  def self.authenticate(email, password)
    user = User.find_by(email: email)

    return nil if user.nil?
    return user if user.password == password
  end
end