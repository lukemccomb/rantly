class RantsController < ApplicationController

  def new
    @new_rant = Rant.new
  end

  def create
    @user = current_user
    @new_rant = Rant.new(allowed_params)
    @new_rant.user_id = current_user.id
    if @new_rant.save
      flash[:new_rant]
      redirect_to "/dashboard"
    else
      render "dashboard/dashboard"
    end

  end

  def destroy
    @rant = Rant.find_by(id: params[:id])
    @rant.destroy
    redirect_to "/dashboard"
  end

  private

  def allowed_params
    params.require(:rant).permit(:title, :rant)
  end


end