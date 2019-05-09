class Badge < ApplicationRecord
  has_one :rule
  has_and_belongs_to_many :users
end
