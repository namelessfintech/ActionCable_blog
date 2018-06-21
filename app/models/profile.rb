class Profile < ApplicationRecord
  belongs_to :user, :dependent => :destroy
  mount_uploader :avatar, AvatarUploader

  def name
    "#{self.first_name} #{self.last_name}".strip
  end
end
