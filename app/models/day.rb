class Day < ActiveRecord::Base
  belongs_to :user
  has_many :meals

  validates :user_id, presence: true
  
  validates :protein, presence: true 
  validates :day, presence: true, uniqueness: { scope: :user_id, message: "Today was already created." }
end