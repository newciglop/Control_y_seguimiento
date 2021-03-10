class AddColumnsUserToAdminControls < ActiveRecord::Migration[6.0]
  def change
    add_reference :admin_controls, :user, null: true, foreign_key: true
  end
end
