class Beer < ApplicationRecord
  validates :title, presence: true
  validates :brand, presence: true
end
