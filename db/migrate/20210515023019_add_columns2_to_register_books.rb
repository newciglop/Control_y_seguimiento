class AddColumns2ToRegisterBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :register_books, :leader_sl, :string
    add_column :register_books, :modality_sl, :string
    add_column :register_books, :status_sl, :string
    add_column :register_books, :company, :string
  end
end
