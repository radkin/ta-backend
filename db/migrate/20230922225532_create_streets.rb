class CreateStreets < ActiveRecord::Migration[7.0]
  def change
    create_table :streets do |t|
      t.string :number
      t.string :name

      t.timestamps
    end
  end
end
