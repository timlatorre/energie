class AddZipTable < ActiveRecord::Migration
  def change
    create_table :zips do |t|
      t.string :zip_code
      t.float :lat
      t.float :long
      t.string :building_type
      t.float :kwh
      t.timestamps
    end
  end
end
