class AddColumnCurrentWorkerToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :current_worker, :boolean
  end
end
