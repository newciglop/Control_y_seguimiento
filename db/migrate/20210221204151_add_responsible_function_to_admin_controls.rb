class AddResponsibleFunctionToAdminControls < ActiveRecord::Migration[6.0]
  def change
    add_reference :admin_controls, :responsible_function, null: false, foreign_key: true
  end
end
