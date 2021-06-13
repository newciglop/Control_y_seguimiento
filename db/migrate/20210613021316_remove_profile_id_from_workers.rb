class RemoveProfileIdFromWorkers < ActiveRecord::Migration[6.0]
  def change
    remove_column :workers, :profile_id, :bigint
  end
end
