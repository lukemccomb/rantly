class UserCommentsController < ApplicationController

  def create
    @comment = UserComment.new(allowed_params)
    @comment.user_id = params[:user_id]
    @comment.commenter_id = current_user.id
    if @comment.save!
      redirect_to user_path(params[:user_id])
    else
      redirect_to user_path(params[:user_id])
    end
  end

  def destroy
    @comment = UserComment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  private

  def allowed_params
    params.require(:user_comment).permit(:comment)
  end

end