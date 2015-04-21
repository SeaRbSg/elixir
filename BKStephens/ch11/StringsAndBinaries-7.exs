defmodule DeathAndTaxes do
  def read_and_calculate(filename) do
    read(filename) |> calculate() 
  end

  defp read(filename) do
    { [header], orders } = File.stream!(filename)
                           |> Stream.map(&line_to_row/1)
                           |> Enum.split(1) #First line is header, rest is orders
    fields = Enum.map(header, &String.to_atom/1)
    Enum.map(orders, &( Enum.zip(fields, row_to_elixir(&1)) ))
  end

  defp line_to_row(line), do: line |> String.rstrip |> String.split(",")

  defp row_to_elixir(values), do: Enum.map(values, &value_to_elixir/1)

  defp value_to_elixir(<< ":", atom::binary >>), do: String.to_atom(atom)
  defp value_to_elixir(number) do
    case Integer.parse(number) do
      {_integer, << ".", _fraction::binary >>} ->
        {float, _rest} = Float.parse(number)
        float
      {integer, _rest} -> integer
      :error -> number
    end
  end

  def tax_rates do
   [ NC: 0.075, TX: 0.08 ]
  end

  def tax_rate_for(state) do
    found = Enum.filter tax_rates, fn {s, _} -> s == state end
    found[state] || 0.0
  end

  def calculate(orders) do
    for [id: id, ship_to: ship_to, net_amount: net_amount] <- orders do
      tax = tax_rate_for(ship_to) * net_amount
      total = net_amount + tax
      [id: id, ship_to: ship_to, net_ammount: net_amount, total_amount: total]
    end
  end
end
