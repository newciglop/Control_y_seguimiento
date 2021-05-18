class AddColumnsCodeToRegisterBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :register_books, :code, :string
  end
end
