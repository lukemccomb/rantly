class CreateUserCommentsTable < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.text     "comment"
      t.integer  "user_id"
      t.integer  "commenter_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
