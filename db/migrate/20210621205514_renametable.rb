class Renametable < ActiveRecord::Migration[6.0]
  def change
    rename_table :states_students, :processes
  end
end
