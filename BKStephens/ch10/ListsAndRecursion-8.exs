defmodule DeathAndTaxes do
  def tax_rates do
   [ NC: 0.075, TX: 0.08 ]
  end

  def orders do 
    [ [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount: 35.50 ],
      [ id: 125, ship_to: :TX, net_amount: 24.00 ],
      [ id: 126, ship_to: :TX, net_amount: 44.80 ],
      [ id: 127, ship_to: :NC, net_amount: 25.00 ],
      [ id: 128, ship_to: :MA, net_amount: 10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 120, ship_to: :NC, net_amount: 50.00 ] ]
  end

  def tax_rate_for(state) do
    found = Enum.filter tax_rates, fn {s, _} -> s == state end
    found[state] || 0.0
  end

  def calculate do
    for [id: id, ship_to: ship_to, net_amount: net_amount] <- orders do
      tax = tax_rate_for(ship_to) * net_amount
      total = net_amount + tax
      [id: id, ship_to: ship_to, net_ammount: net_amount, total_amount: total]
    end
  end
end
