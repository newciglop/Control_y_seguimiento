class AddColumnsAnnexedToThemes < ActiveRecord::Migration[6.0]
  def change
    add_column :themes, :annexed, :string
  end
end
