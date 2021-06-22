class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.string :name
      t.string :color
      t.boolean :enable

      t.timestamps
    end
  end
end
