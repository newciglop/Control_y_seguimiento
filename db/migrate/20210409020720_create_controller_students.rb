class CreateControllerStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :controller_students do |t|

      t.timestamps
    end
  end
end
