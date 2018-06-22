class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = current_user.profile.messages.build(message_params)
    @mesage.room = current_room
    @message.save
    redirect_to user_profile_path(current_user)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end
