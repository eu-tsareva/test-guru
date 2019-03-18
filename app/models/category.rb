class Category < ApplicationRecord
  has_many :quizzes

  default_scope { order(title: :asc) }

  validates :title, presence: true
end
