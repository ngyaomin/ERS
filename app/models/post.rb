class Post < ApplicationRecord
  has_many :comments
  validates :subject, presence: true
  validates :content, presence: true
end
