class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.string :name, null: false, :limit => 30
      t.string :description, :limit => 200
      t.integer :energy, null: false, :default => 0
      t.decimal :fat, null: false, :default => 0.0, precision: 4, scale: 1
      t.decimal :protein, null: false, :default => 0.0, precision: 4, scale: 1
      t.decimal :carbohydrate, null: false, :default => 0.0, precision: 4, scale: 1
      t.decimal :fibre, null: false, :default => 0.0, precision: 4, scale: 1
    end
  end
end
