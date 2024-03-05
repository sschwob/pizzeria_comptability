# Cleaning
Restaurant.destroy_all

pizzerias = ["Dominos", "Pizza Zio", "Caldo Pizza Wasquehal", "Papa Rafaele", "Pizza Hut", "Don Corneo Pizza", "Pizza Paï"]

pizzerias.each do |pizzeria_name|
  pizzeria = Restaurant.create!(name: pizzeria_name)
  
  (2020..2023).each do |year|
    (1..12).each do |month|
      date = Date.new(year, month)
      BalanceSheet.create!(
        month:  date,
        restaurant: pizzeria,
        turnover: rand(50.0..300.0).round(2)
      )
    end
  end

  (1..3).each do |month|
    date = Date.new(2024, month)
    BalanceSheet.create!(
      month:  date,
      restaurant: pizzeria,
      turnover: rand(50.0..300.0).round(2)
    )
  end
end
