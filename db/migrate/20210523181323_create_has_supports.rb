class CreateHasSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :has_supports do |t|
      t.references :worker, null: nil, foreign_key: true
      t.references :admin_control, null: nil, foreign_key: true

      t.timestamps
    end
  end
end
