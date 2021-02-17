class AddEnableToAdminControls < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_controls, :enable, :boolean
  end
end
