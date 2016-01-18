class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.text :question
      t.text :answer
      t.string :link
      t.text :hint

      t.timestamps null: false
    end
  end
end
