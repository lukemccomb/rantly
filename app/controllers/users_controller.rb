class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
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
    if @user.update(allowed_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def show
    @rant = Rant.new
    @user = User.find_by(id: params[:id])
    @user_rants = @user.rants
  end

  private

  def allowed_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :rate)
  end

end
