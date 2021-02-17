class CreateAdminControls < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_controls do |t|
      t.integer :code
      t.references :concept, null: false, foreign_key: true
      t.references :theme, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.date :start_date
      t.date :final_date
      t.integer :tracking_type
      t.integer :state
      t.references :company, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.references :responsible_function, null: false, foreign_key: true
      t.integer :responsible
      t.integer :support
      t.integer :advance
      t.text :process
      t.string :link_process
      t.string :link_drive

      t.timestamps
    end
  end
end
