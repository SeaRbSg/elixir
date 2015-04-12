defmodule Checkout do
  def calculate_sales_tax([], _tax_rates), do: []
  def calculate_sales_tax([ head | tail ], tax_rates) do
    [ add_total_amount(head, tax_rates) | calculate_sales_tax(tail, tax_rates) ]
 end

  # private

  defp add_total_amount(order, tax_rates) do
    order ++ [total_amount: total_amount(order, tax_rates)]
  end

  defp total_amount(order, tax_rates) do
    tax_rate = tax_rates[order[:ship_to]] || 0.0
    total_amount = order[:net_amount] + (order[:net_amount] * tax_rate)
  end
end

tax_rates = [ NC: 0.075, TX: 0.08 ]

orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount: 35.50 ],
  [ id: 125, ship_to: :TX, net_amount: 24.00 ],
  [ id: 126, ship_to: :TX, net_amount: 44.80 ],
  [ id: 127, ship_to: :NC, net_amount: 25.00 ],
  [ id: 128, ship_to: :MA, net_amount: 10.00 ],
  [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  [ id: 120, ship_to: :NC, net_amount: 50.00 ],
]

IO.inspect Checkout.calculate_sales_tax(orders, tax_rates)