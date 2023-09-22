class CreateDobs < ActiveRecord::Migration[7.0]
  def change
    create_table :dobs do |t|
      t.string :date
      t.integer :age

      t.timestamps
    end
  end
end
