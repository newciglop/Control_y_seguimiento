class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :phone_2
      t.string :email
      t.references :profile, null: false, foreign_key: true
      t.integer :profile_2
      t.integer :profile_3
      t.integer :profile_4

      t.timestamps
    end
  end
end
