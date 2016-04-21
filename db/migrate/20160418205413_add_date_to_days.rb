class AddDateToDays < ActiveRecord::Migration[5.0]
  def self.up
    add_column :days, :day, :date
    change_column :days, :day, :date, :null => false
  end

  def self.down
    remove_column :days, :day
  end
end
