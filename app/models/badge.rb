class Badge < ApplicationRecord
  has_one :rule, dependent: :destroy
  has_and_belongs_to_many :users
end
