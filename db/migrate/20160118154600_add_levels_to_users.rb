class AddLevelsToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :level, index: true, foreign_key: true
    add_column :users, :name, :string
    add_column :users, :college, :string
  end
end
