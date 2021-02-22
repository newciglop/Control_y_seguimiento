class AddResponsibleFunctionIdToAdminControls < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_controls, :responsible_function_id, :integer
  end
end
