class AddColumnTitleIdToStudents < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :title, null: false, foreign_key: true
  end
end
