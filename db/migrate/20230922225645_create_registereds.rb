class CreateRegistereds < ActiveRecord::Migration[7.0]
  def change
    create_table :registereds do |t|
      t.string :date
      t.integer :age

      t.timestamps
    end
  end
end
