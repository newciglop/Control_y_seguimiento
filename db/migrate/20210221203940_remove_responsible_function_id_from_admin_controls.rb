class RemoveResponsibleFunctionIdFromAdminControls < ActiveRecord::Migration[6.0]
  def change
    remove_column :admin_controls, :responsible_function_id, :integer
  end
end
