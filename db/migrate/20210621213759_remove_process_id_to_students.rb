class RemoveProcessIdToStudents < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :process_id
  end
end
