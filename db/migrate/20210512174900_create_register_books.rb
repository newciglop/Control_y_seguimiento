class CreateRegisterBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :register_books do |t|
      t.references :offer, null: true, foreign_key: true
      t.references :admin_control, null: true, foreign_key: true
      t.integer :create_user
      t.integer :update_user
      t.integer :destroy_user
      t.date :create_time
      t.date :update_time
      t.date :destroy_time
      t.string :code_sa
      t.string :code_sl

      t.timestamps
    end
  end
end
