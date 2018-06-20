class Profile < ApplicationRecord
  belongs_to :user, :dependent => :destroy
  mount_uploader :avatar, AvatarUploader

end
