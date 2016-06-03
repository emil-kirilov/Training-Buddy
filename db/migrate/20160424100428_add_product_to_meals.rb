class AddProductToMeals < ActiveRecord::Migration[5.0]
  def change
    add_reference :meals, :food, foreign_key: true, index: true
  end
end
