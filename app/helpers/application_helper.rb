module ApplicationHelper
  def turnover_color(turnover, average)
    turnover > average ? "green" : "orange"
  end
end
