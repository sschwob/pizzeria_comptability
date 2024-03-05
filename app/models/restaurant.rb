# Nommé Restaurant car "rails g model Pizzeria" attribut automatiquement le nom "pizzerium"
class Restaurant < ApplicationRecord
  has_many :balance_sheets, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
