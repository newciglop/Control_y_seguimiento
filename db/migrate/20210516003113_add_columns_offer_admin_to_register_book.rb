class AddColumnsOfferAdminToRegisterBook < ActiveRecord::Migration[6.0]
  def change
    add_column :register_books, :is_offer, :boolean
    add_column :register_books, :is_admin_control, :boolean
  end
end
