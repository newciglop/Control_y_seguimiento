class CreateResponsibleFunctions < ActiveRecord::Migration[6.0]
  def change
    create_table :responsible_functions do |t|
      t.string :name
      t.text :description
      t.boolean :enable

      t.timestamps
    end
  end
end
