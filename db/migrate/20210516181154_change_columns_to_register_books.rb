class ChangeColumnsToRegisterBooks < ActiveRecord::Migration[6.0]
  def change

    change_column :register_books, :create_user, :string
    change_column :register_books, :update_user, :string
    change_column :register_books, :destroy_user, :string

  end
end
