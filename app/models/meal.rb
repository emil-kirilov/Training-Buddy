class Meal < ActiveRecord::Base
  belongs_to :day

  validates :product, presence: true, :length => { :maximum => 100 }
  validates :grams, presence: true, :length => { :maximum => 5000 }
  validates :day_id, presence: true 
end