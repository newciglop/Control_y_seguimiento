class CreateHasEngineers < ActiveRecord::Migration[6.0]
  def change
    create_table :has_engineers do |t|
      t.references :designation, null: false, foreign_key: true
      t.references :engineer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
