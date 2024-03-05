class TurnoverComputeService
  def self.average_turnover(pizzerias)
    return 0 if pizzerias.empty?

    (pizzerias.sum { |pizzeria| pizzeria[:annual_turnover] } / pizzerias.count).round(2)
  end
end
