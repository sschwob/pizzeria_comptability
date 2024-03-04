# Cleaning
Pizzerium.destroy_all

pizzerias = ["Dominos", "Pizza Zio", "Caldo Pizza Wasquehal", "Papa Rafaele"]

pizzerias.each do |pizzeria_name|
  pizzeria = Pizzerium.create!(name: pizzeria_name)
  
  (1..12).each do |month|
    date = Date.strptime("#{month}-2024", "%m-%y")
    BalanceSheet.create!(
      month:  date,
      pizzerium: pizzeria,
      turnover: rand(50.0..300.0).round(2)
    )
  end
end
