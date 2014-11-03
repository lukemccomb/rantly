class DisablesController < ApplicationController

  def create
    @disable = Disable.new(user_id: params[:user_id])
    @disable.save!
    redirect_to :back
  end

  def destroy
    @disable = Disable.find_by(user_id: params[:user_id])
    @disable.delete
    redirect_to :back
  end

end