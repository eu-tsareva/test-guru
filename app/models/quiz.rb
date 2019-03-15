class Quiz < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users

  def self.by_category(title)
    Quiz
      .joins(:category)
      .order(title: :desc)
      .where(categories: { title: title })
      .pluck(:title)
  end
end
