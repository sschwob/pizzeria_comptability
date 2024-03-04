class PizzeriasController < ApplicationController
  def index
    date = Date.new(2024)

    pizzerias = BalanceSheet.includes(:restaurant)
                            .where(month: date.beginning_of_year..date.end_of_year)
                            .group_by(&:restaurant)
  
    @pizzerias = pizzerias.map do |pizzeria|
      {
        name: pizzeria.first.name,
        balance_sheets: pizzeria.last,
        annual_turnover: TurnoverComputeService.annual_turnover(pizzeria.last)
      }
    end.sort_by { |pizzeria| pizzeria[:annual_turnover] }

    @average_turnover = TurnoverComputeService.average_turnover(@pizzerias)
  end
end
