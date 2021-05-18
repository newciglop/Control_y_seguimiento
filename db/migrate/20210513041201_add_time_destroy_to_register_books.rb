class AddTimeDestroyToRegisterBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :register_books, :time_destroy, :time
  end
end
