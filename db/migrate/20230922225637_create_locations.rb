class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.string :country
      t.string :postcode
      t.references :coordinates, null: false, foreign_key: true
      t.references :timezone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
