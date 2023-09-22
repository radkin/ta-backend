class CreateTimezones < ActiveRecord::Migration[7.0]
  def change
    create_table :timezones do |t|
      t.string :offset
      t.string :description

      t.timestamps
    end
  end
end
