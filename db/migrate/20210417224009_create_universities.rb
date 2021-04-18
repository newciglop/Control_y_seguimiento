class CreateUniversities < ActiveRecord::Migration[6.0]
  def change
    create_table :universities do |t|
      t.string :name
      t.boolean :enable
      t.string :address
      t.string :phone
      t.string :contact
      t.string :contact_phone
      t.string :agreement

      t.timestamps
    end
  end
end
