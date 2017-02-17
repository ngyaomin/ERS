class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :subject, presence: true
  validates :content, presence: true
end
