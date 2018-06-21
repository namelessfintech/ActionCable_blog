class Profile < ApplicationRecord
  belongs_to :user, :dependent => :destroy
  mount_uploader :avatar, AvatarUploader

  after_create :create_chatroom

  def full_name
    "#{self.first_name}" + " " + "#{self.last_name}"
  end

  private

  def create_chatroom
    hyphenated_username = self.full_name.split.join("-")
    Room.create(name: hyphenated_username, user_id: self.id)
  end

end
