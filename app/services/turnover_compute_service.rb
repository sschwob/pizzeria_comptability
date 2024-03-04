class TurnoverComputeService
  def self.annual_turnover(balance_sheets)
    balance_sheets.sum { |balance_sheet| balance_sheet.turnover }.round(2)
  end

  def self.average_turnover(pizzerias)
    (pizzerias.sum { |pizzeria| pizzeria[:annual_turnover] } / pizzerias.count).round(2)
  end
end
