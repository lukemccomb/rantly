class ChangeCommentsCommentText < ActiveRecord::Migration
  def change
    change_column :comments, :comment, :text
  end
end
