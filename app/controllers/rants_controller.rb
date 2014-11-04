class RantsController < ApplicationController

  def index
    @rants = Rant.all.order("created_at DESC")
  end

  def new
    @new_rant = Rant.new
  end

  def create
    @rant = Rant.new
    @rant = current_user.rants.build(allowed_params)
    if @rant.save
      flash[:new_rant]
      redirect_to dashboard_path
    else
      @user = current_user
      @rants = Rant.where.not(user_id: @user.id)
      @user_rants = Rant.where(user_id: @user.id)
      render 'dashboards/show'
    end
  end

  def destroy
    @rant = Rant.find_by(id: params[:id])
    @rant.destroy
    redirect_to dashboard_path
  end

  def show
    @this_rant = Rant.find_by(id: params[:id])
    @rant = Rant.new
    @comment = Comment.new
  end

  def update
    @this_rant = Rant.find_by(id: params[:id])
    @this_rant.update_attributes(spam: params[:spam])
    redirect_to dashboard_path
  end

  private

  def allowed_params
    params.require(:rant).permit(:title, :rant)
  end

end