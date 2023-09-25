class UpdateRandomUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :random_users, :street, null: false, foreign_key: true
  end
end
