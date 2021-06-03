class CreateHasManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :has_managers do |t|
      t.references :worker, null: false, foreign_key: true
      t.references :admin_control, null: false, foreign_key: true

      t.timestamps
    end
  end
end
