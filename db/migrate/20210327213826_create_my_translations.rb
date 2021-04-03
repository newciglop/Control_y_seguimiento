class CreateMyTranslations < ActiveRecord::Migration[6.0]
  def self.up
    create_table :my_translations do |t|
      t.string :locale
      t.string :key
      t.text   :value
      t.text   :interpolations
      t.boolean :is_proc, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :my_translations
  end
end
