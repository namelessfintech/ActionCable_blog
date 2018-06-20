class ProfilesController < ApplicationController

  def new
    @user = find_user
    @profile = @user.build_profile
  end

  private

  def find_user
      User.find(params[:user_id])
  end

end
