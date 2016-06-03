class Food < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true

  validates :name, presence: true, :length => { :maximum => 30, 
    too_long: "Name can be up to 30 characters in length." }, 
    uniqueness: { message: "Food with such name exists." } 
  validates :description, presence: true, :length => { :maximum => 200 ,
    too_long: "desription can be up to 200 characters in length" }
  
  validates :energy, presence: true, numericality: { only_integer: true }
  validates :fat, presence: true, numericality: true
  validates :protein, presence: true, numericality: true
  validates :carbohydrate, presence: true, numericality: true
  validates :fibre, presence: true, numericality: true
end