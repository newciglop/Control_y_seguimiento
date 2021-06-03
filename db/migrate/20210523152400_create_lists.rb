class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :description
      t.boolean :completed , default: false
      t.references :admin_control, null: true, foreign_key: true

      t.timestamps
    end
  end
end
