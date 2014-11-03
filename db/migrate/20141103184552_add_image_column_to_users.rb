class AddImageColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :text, default: "http://www.nycaviation.com/newspage/wp-content/uploads/2013/07/Ranting-Homer2.gif"
  end
end
