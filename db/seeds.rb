# Cleaning
Restaurant.destroy_all

pizzerias = ["Dominos", "Pizza Zio", "Caldo Pizza Wasquehal", "Papa Rafaele"]

pizzerias.each do |pizzeria_name|
  pizzeria = Restaurant.create!(name: pizzeria_name)
  
  (2022..2024).each do |year|
    (1..12).each do |month|
      date = Date.new(year, month)
      BalanceSheet.create!(
        month:  date,
        restaurant: pizzeria,
        turnover: rand(50.0..300.0).round(2)
      )
    end
  end
end
