class CreateStatesStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :states_students do |t|
      t.string :name
      t.boolean :enable , default: true

      t.timestamps
    end
  end
end
