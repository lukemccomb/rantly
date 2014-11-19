class UsersController < ApplicationController

  def index
      @users = User.select("users.*, COUNT(rants.id) as rant_num")
                    .joins("LEFT JOIN rants ON rants.user_id = users.id")
                    .group("users.id")
                    .order("rant_num #{params[:sort] || "DESC"}")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      UserMailer.confirmation_email(@user).deliver
      UserMailer.welcome_email(@user).deliver
      Keen.publish(:sign_ups, { :username => user.username, :user_id => user.id })
      redirect_to main_path
      flash[:notice] = "Thank you for registering! Please log in to begin ranting."
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(allowed_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def show
    @comment = UserComment.new
    @rant = Rant.new
    @user = User.find_by(id: params[:id])
    @user_rants = @user.rants.sort { |ranta, rantb| rantb.favorites.length <=> ranta.favorites.length }
  end

  private

  def allowed_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :bio, :rate, :image)
  end

end
