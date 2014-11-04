class AddSpamToRants < ActiveRecord::Migration
  def change
    add_column :rants, :spam, :boolean, default: false
  end
end
