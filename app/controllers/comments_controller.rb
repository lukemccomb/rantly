class CommentsController < ApplicationController

  def create
    @comment = Comment.new(allowed_params)
    @comment.rant_id = params[:rant_id]
    @comment.user_id = current_user.id
    if @comment.save!
      redirect_to rant_path(params[:rant_id])
    else
      redirect_to rant_path(params[:id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  private

  def allowed_params
    params.require(:comment).permit(:comment)
  end

end