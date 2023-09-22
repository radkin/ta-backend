class CreateLogins < ActiveRecord::Migration[7.0]
  def change
    create_table :logins do |t|
      t.string :uuid
      t.string :username
      t.string :password
      t.string :salt
      t.string :md5
      t.string :sha1
      t.string :sha256

      t.timestamps
    end
  end
end
