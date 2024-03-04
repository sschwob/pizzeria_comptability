class BalanceSheet < ApplicationRecord
  belongs_to :restaurant

  validates :month, presence: true
  validates :turnover, presence: true

  validate :one_turnover_per_month_per_restaurant

  def one_turnover_per_month_per_restaurant
    if self.class.where(restaurant_id: self.restaurant_id)
                 .where('EXTRACT(MONTH FROM month) = ? AND EXTRACT(YEAR FROM month) = ?', self.month.month, self.month.year)
                 .any?
      errors.add(:month, "balance_sheet #{self.month.year}-#{self.month.month} already exists for pizzeria_id #{self.restaurant_id}")
    end
  end 
end
