class Day < ActiveRecord::Base
  belongs_to :user
  has_many :meals

  attr_writer :protein

  validates :user_id, presence: true
  
  validates :protein, presence: true 
  validates :day, presence: true, uniqueness: { message: "Today was already created." }

  def self.protein=(ammount)
  	@day.protein += ammount
  end
end
