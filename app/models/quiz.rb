class Quiz < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'
  has_many :questions
  has_and_belongs_to_many :users

  scope :easy, -> { where(level: [0..1]) }
  scope :medium, -> { where(level: [2..4]) }
  scope :difficult, -> { where('level > ?', 4) }
  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, (lambda do |title|
    joins(:category)
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)
  end)

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
end
