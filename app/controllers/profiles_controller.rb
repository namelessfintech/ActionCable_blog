class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user

  def new
    @user = find_user
    @profile = Profile.new
  end

  def create
    @user = find_user
    @profile = @user.build_profile(set_params)
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_profile_path( params[:user_id] )
    else
      render action: :new
    end
  end

  def show
    @user = find_user
  end

  def edit
    @user = find_user
    @profile = @user.profile
  end

  def update
    @user = find_user
    @profile = @user.profile
    if @profile.update(set_params)
      flash[:success] = "Profile Updated!"
      redirect_to user_profile_path( params[:user_id] )
    else
      render action: :edit
    end
  end


  private

  def only_current_user
    @user = find_user
    redirect_to(root_path) unless @user == current_user
  end

  def find_user
      User.find(params[:user_id])
  end

  def set_params
    params.require(:profile).permit(:first_name,:last_name,:bio,:avatar)
  end

end
