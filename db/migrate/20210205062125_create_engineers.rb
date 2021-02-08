class CreateEngineers < ActiveRecord::Migration[6.0]
  def change
    create_table :engineers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :enable
      t.references :profile, null: false, foreign_key: true
      t.integer :profile_two
      t.integer :profile_three

      t.timestamps
    end
  end
end
