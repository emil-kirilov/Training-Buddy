class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.references :day, null: false
      t.string :product, null: false, :limit => 100
      t.integer :grams, null: false, :limit => 5000, :default => 0
      t.string :description
    end
  end
end
