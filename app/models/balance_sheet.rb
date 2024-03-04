class BalanceSheet < ApplicationRecord
  belongs_to :restaurant

  validates :month, presence: true
  validates :turnover, presence: true
end
