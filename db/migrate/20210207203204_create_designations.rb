class CreateDesignations < ActiveRecord::Migration[6.0]
  def change
    create_table :designations do |t|
      t.string :code
      t.string :activity
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
