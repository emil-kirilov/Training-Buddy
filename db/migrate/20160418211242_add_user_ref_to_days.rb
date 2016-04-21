class AddUserRefToDays < ActiveRecord::Migration[5.0]
  def change
    add_reference :days, :user, foreign_key: true, index: true
  end
end
