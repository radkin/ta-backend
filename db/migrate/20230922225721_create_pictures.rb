class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.string :large
      t.string :medium
      t.string :thumbnail

      t.timestamps
    end
  end
end
