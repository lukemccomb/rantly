class RantsController < ApplicationController

  def new
    @new_rant = Rant.new
  end

  def create
    rant = current_user.rants.build(allowed_params)
    if rant.save
      flash[:new_rant]
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end

  end

  def destroy
    @rant = Rant.find_by(id: params[:id])
    @rant.destroy
    redirect_to dashboard_path
  end

  private

  def allowed_params
    params.require(:rant).permit(:title, :rant)
  end

end