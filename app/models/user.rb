class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Friends Actively
  has_many :friendships_active, class_name:  "Friendship", foreign_key: "user_id", dependent: :destroy
  has_many :friends, through: :friendships_active

  # Friends passively
  has_many :friendships_passive, class_name:  "Friendship", foreign_key: "friend_id", dependent: :destroy
  has_many :users, through: :friendships_passive, class_name: "User"

  # All friends
  def all_friends
    users + friends
  end

  # Friends a user
  def friend(other_user)
    friends << other_user
  end

  # Unriends a user.
  def unfriend(other_user)
    friends.delete(other_user)
  end

  # Returns true if the current user is friends with the other user.
  def friends?(other_user)
    all_friends.include?(other_user)
  end
end
