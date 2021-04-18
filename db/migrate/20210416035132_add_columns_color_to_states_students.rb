class AddColumnsColorToStatesStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :states_students, :color, :string
  end
end
