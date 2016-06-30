class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :title
      t.string :description
      t.time :delivered_at

      t.timestamps null: false
    end
  end
end
