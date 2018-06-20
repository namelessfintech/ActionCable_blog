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

end
