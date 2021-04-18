class AddColumnUniversityIdToStudents < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :university, null: false, foreign_key: true
  end
end
