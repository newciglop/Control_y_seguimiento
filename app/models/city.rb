class City < ApplicationRecord
  belongs_to :state
  require 'csv'
  def  self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
      City.create! row.to_hash
    end
  end
end
