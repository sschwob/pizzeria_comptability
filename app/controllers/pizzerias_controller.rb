class PizzeriasController < ApplicationController
  def index
    pizzerias = Pizzerium.all.includes(:balance_sheets)
    @pizzerias_with_balance_sheets = pizzerias.map do |pizzeria|
      pizzeria.attributes.merge(
        'balance_sheets': pizzeria.balance_sheets,
        'annual_turnover': TurnoverComputeService.annual_turnover(pizzeria.balance_sheets)
      )
    end

    @average_turnover = TurnoverComputeService.average_turnover(@pizzerias_with_balance_sheets)
  end
end
