class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.references :level, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :attempt

      t.timestamps null: false
    end
  end
end
