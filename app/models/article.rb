class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  default_scope {order(created_at: :desc)}

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories


  def categories_attributes=(attr)
    attr.each do |key, name|
      self.categories << Category.find_or_create_by(name) unless name[:name].empty?
    end
  end
end
