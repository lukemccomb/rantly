class RantsController < ApplicationController

  def new
    @rant = Rant.new
  end

  def create
    @rant = Rant.new(allowed_params)
    @rant.user_id = current_user.id
    if @rant.save
      flash[:new_rant]
      redirect_to "/dashboard"
    else
      redirect_to "/dashboard"
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