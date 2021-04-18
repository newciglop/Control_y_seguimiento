class AddColumnCityIdToUniversities < ActiveRecord::Migration[6.0]
  def change
    add_reference :universities, :city, null: false, foreign_key: true
  end
end
