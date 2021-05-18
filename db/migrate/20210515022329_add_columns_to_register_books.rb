class AddColumnsToRegisterBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :register_books, :concept_admin, :string
    add_column :register_books, :theme_admin, :string
    add_column :register_books, :type_admin, :string
    add_column :register_books, :item_admin, :string
    add_column :register_books, :rol_responsible, :string
  end
end
