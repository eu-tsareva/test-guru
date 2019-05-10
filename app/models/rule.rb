class Rule < ApplicationRecord
  TYPES = %i[level category score attempts].freeze

  belongs_to :badge

  def self.values_by_type(type)
    send "#{type}_values"
  end

  def self.level_values
    Quiz.all.pluck(:level).uniq.map { |level| [level, level] }
  end

  def self.category_values
    Category.all.map { |category| [category.id, category.title] }
  end

  def self.attempts_values
    [[1, 1], [3, 3], [5, 5]]
  end

  def self.score_values
    [[75, 75], [90, 90], [100, 100]]
  end

  def text
    "#{I18n.t(attr, scope: 'admin.rules')}: #{value}"
  end
end
