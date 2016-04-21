class SetProteinDefaultValueOfZero < ActiveRecord::Migration[5.0]
  def change
    change_column :days, :protein, :integer, :default => 0
  end
end
