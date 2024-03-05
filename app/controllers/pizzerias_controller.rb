class PizzeriasController < ApplicationController
  def index
    @selected_year = params[:year].present? ? params[:year].to_i : 2024
    date = Date.new(@selected_year)

    balance_sheets = BalanceSheet.includes(:restaurant).where(month: date.beginning_of_year..date.end_of_year)
    grouped_balance_sheets = balance_sheets.group_by(&:restaurant)
    annual_turnovers = balance_sheets.order("sum(turnover)").group(:restaurant).sum(:turnover)

    @pizzerias = []
    annual_turnovers.each do |annual_turnover|
      @pizzerias << {
        id: annual_turnover[0].id,
        name: annual_turnover[0].name,
        balance_sheets: grouped_balance_sheets[annual_turnover[0]],
        annual_turnover: annual_turnover[1]
      }
    end

    @average_turnover = TurnoverComputeService.average_turnover(@pizzerias)
  end
end
