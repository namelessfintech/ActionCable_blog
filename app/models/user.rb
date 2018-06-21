class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # before_save {self.email = email.downcase}
  has_many :articles
  has_one :profile
  has_one :room
  # validates :name, length:{maximum:20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,length:{maximum: 64},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  after_create :create_chatroom


  def full_name
    "#{self.profile.first_name}" + " " + "#{self.profile.last_name}"
  end

  private

  def create_chatroom
    hyphenated_username = self.full_name.split.join("-")
    Room.create(name: hyphenated_username, user_id: self.id)
  end


end
