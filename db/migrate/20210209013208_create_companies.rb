class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.boolean :enable
      t.string :identification

      t.timestamps
    end
  end
end
