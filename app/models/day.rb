class Day < ActiveRecord::Base
  belongs_to :user

  validates :protein, presence: true 
  validates :day, presence: true, uniqueness: true
  validates :user_id, presence: true
end 