class ChangeMealsGrams < ActiveRecord::Migration[5.0]
  def up
    change_table :meals do |t|
      t.change :grams, :integer, :limit => 5
    end
  end

  def down
    change_table :meals do |t|
      t.change :grams, :integer
    end
  end
end
