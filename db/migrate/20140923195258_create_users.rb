class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "username", null: false
      t.string "password_digest", null: false
      t.string "first_name"
      t.string "last_name"
      t.string "bio"
      t.string "rate"

      t.timestamps
    end
  end
end
