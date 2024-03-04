class Pizzerium < ApplicationRecord
  has_many :balance_sheets, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
