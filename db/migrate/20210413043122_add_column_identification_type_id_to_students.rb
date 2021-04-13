class AddColumnIdentificationTypeIdToStudents < ActiveRecord::Migration[6.0]
  def change
     add_reference :students, :states_student, null: false, foreign_key: true
  end
end
