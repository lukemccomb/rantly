class ChangeUserImageDefault < ActiveRecord::Migration
  def change
    change_column_default :users, :image, nil
  end
end
