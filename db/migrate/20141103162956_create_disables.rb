class CreateDisables < ActiveRecord::Migration
  def change
    create_table :disables do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
