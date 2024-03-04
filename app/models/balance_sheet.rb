class BalanceSheet < ApplicationRecord
  belongs_to :pizzerium

  validates :month, presence: true
  validates :turnover, presence: true
end
