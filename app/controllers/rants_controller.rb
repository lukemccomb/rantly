require 'time'

class RantsController < ApplicationController

  def index
    @rants = Rant.all.order("created_at DESC")
  end

  def new
    @new_rant = Rant.new
  end

  def create
    @rant = Rant.new(allowed_params)
    @rant.user_id = current_user.id
    if @rant.save
      flash[:new_rant]
      redirect_to :back
    else
      @user = current_user
      @rants = Rant.where.not(user_id: @user.id)
      @user_rants = Rant.where(user_id: @user.id)
      render :json =>  { errors: { title_errors: @rant.errors.full_messages_for(:title).first,
                        rant_errors: @rant.errors.full_messages_for(:rant).first }}
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
     if @this_rant.spam
       @this_rant.spam = false
     else
       @this_rant.spam = true
     end
    @this_rant.save!
    if current_user.admin == true
      redirect_to spam_path
    else
      redirect_to dashboard_path
    end
  end

  def find_rants
    @rants = Rant.where(:created_at => start_date..end_date)
    render :index
  end

  private

  def allowed_params
    params.require(:rant).permit(:title, :rant)
  end

  def start_date
    if params[:start_date]
      params[:start_date]
    else
      []
    end

  end

  def end_date
    if params[:end_date]
      params[:end_date]
    else
      []
    end
  end

end