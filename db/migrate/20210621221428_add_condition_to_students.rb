class AddConditionToStudents < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :condition, null: false, foreign_key: true
  end
end
