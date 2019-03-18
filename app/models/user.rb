class User < ApplicationRecord
  has_many :created_quizzes, class_name: 'Quiz', foreign_key: :creator_id
  has_and_belongs_to_many :quizzes

  validates :name, presence: true
  validates :email, presence: true
end
