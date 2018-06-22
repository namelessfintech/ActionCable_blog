class Profile < ApplicationRecord
  belongs_to :user, :dependent => :destroy
  mount_uploader :avatar, AvatarUploader
  has_one :room
  has_many :messages

  after_create :create_chatroom

  def full_name
    "#{self.first_name}" + " " + "#{self.last_name}"
  end

  private

  def create_chatroom
    hyphenated_username = self.full_name.split.join("-")
    Room.create(name: hyphenated_username, profile_id: self.id)
  end

  def name
    "#{self.first_name} #{self.last_name}".strip
  end
end
