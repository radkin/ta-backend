class CreateRandomUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :random_users do |t|
      t.string :gender
      t.references :name, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.string :email
      t.references :login, null: false, foreign_key: true
      t.references :dob, null: false, foreign_key: true
      t.references :registered, null: false, foreign_key: true
      t.string :phone
      t.string :cell
      t.references :ruid, null: false, foreign_key: true
      t.references :picture, null: false, foreign_key: true
      t.string :nat

      t.timestamps
    end
  end
end
