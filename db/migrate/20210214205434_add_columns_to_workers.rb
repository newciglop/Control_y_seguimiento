class AddColumnsToWorkers < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :identification, :string
    add_reference :workers, :type_identification, null: false, foreign_key: true
  end
end
