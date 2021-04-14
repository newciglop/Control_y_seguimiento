class AddColumnIdentificationTypeIdToStudents < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :type_identification, null: false, foreign_key: true
  end
end
