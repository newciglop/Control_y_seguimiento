class AddSaToAdminControl < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_controls, :sa, :string
  end
end
