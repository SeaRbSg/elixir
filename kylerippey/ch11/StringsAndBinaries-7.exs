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
    order[:net_amount] + (order[:net_amount] * tax_rate)
  end
end


defmodule Orders do
  def parse(filename) do
    {:ok, input} = File.read(filename)

    records = String.split(input)

    Enum.map(records, &(parse_record(&1)))
  end

  # private

  defp parse_record(record) do
    record = String.strip(record)
    [id, state, amount] = String.split(record, ",")

    [
      id: id |> Integer.parse |> elem(0),
      ship_to: state |> String.lstrip(?:) |> String.to_atom,
      net_amount: amount |> Float.parse |> elem(0)
    ]
  end
end


orders = Orders.parse("orders.csv")
tax_rates = [ NC: 0.075, TX: 0.08 ]
IO.inspect Checkout.calculate_sales_tax(orders, tax_rates)