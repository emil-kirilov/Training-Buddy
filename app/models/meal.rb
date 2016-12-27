class Meal < ActiveRecord::Base
  belongs_to :day
  has_many :foods

  attr_reader :protein

  validates :day_id, presence: true
  validates :food_id, presence: true 
  validates :grams, presence: true, :length => { :maximum => 5000 ,
    too_long: "Grams can be up to 5 characters in length" }

  def self.meals(day)
    where(day_id: day.id)
  end

  def self.get_protein(day)
  	food = Food.find(day.food_id)
  	food.protein * day.grams / 100.0
  end
end