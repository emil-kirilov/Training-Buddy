class RemoveProductFromMeals < ActiveRecord::Migration[5.0]
  def change
    remove_column :meals, :product, :string
  end
end
