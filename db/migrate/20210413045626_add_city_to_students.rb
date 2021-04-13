class AddCityToStudents < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :city, null: false, foreign_key: true
  end
end
