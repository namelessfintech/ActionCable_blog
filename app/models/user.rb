class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # before_save {self.email = email.downcase}
  has_many :articles
  has_one :profile
  # validates :name, length:{maximum:20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,length:{maximum: 64},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

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


  def friendship(user)
    friendship = Friendship.where("(user_id = ? AND friend_id = ?) OR (user_id = ? AND friend_id = ?)",
      user.id, self.id, self.id, user.id).first
  end

  # Returns true if the current user is friends with the other user.
  def friends?(other_user)
    all_friends.include?(other_user)
  end
end
