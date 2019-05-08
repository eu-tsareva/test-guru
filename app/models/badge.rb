class Badge < ApplicationRecord
  belongs_to :rule
  has_and_belongs_to_many :users
end
