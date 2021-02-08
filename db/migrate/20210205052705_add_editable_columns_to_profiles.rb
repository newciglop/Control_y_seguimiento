class AddEditableColumnsToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :editable, :boolean, default: true
    add_column :profiles, :profile_type, :integer

  end
end
