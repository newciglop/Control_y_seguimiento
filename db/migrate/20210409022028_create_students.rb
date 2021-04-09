class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.string :phone
      t.string :mail
      t.string :address
      t.decimal :score
      t.string :semester
      t.string :career
      t.string :comment
      t.integer :leader_first
      t.integer :leader_second
      t.string :mail_2
      t.string :phone_2
      t.string :age
      t.string :birthday
      t.string :link_university
      t.string :link_data
      t.string :identification
      t.string :issued_in

      t.timestamps
    end
  end
end
