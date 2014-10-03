class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|

      t.string "rant"
      t.belongs_to :user

      t.timestamps
    end
  end
end
