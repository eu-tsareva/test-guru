class Quiz < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'
  has_many :questions
  has_many :quiz_passages
  has_many :users, through: :quiz_passages

  scope :easy, -> { where(level: [0..1]) }
  scope :medium, -> { where(level: [2..4]) }
  scope :difficult, -> { where('level > ?', 4) }
  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, (lambda do |title|
    joins(:category)
      .where(categories: { title: title })
  end)
  scope :by_category_id, ->(category) { where(category: category)}
  scope :valid, -> { joins(questions: :answers).group(:id) }

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
  validates :time, numericality: { only_integer: true,
                                   greater_than_or_equal_to: 1 }

  def self.titles(category)
    Quiz
      .by_category(category)
      .order(title: :desc)
      .pluck(:title)
  end
end
