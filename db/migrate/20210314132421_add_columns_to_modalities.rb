class AddColumnsToModalities < ActiveRecord::Migration[6.0]
  def change
    add_column :modalities, :enable, :boolean , default: true
  end
end
