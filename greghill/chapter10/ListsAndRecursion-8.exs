defmodule Mylist do
  import Keyword

  def apply_tax_to_list_and_total(taxes_by_state, orders_list), 
    do:
      Enum.map(orders_list,&(put(&1,:total_amount,get_total_with_tax(&1,taxes_by_state))))
  

  def get_total_with_tax(list, taxes),
    do:
      list[:net_amount] * (1 + get(taxes,list[:ship_to],0))

end


# Write a function that takes both lists and returns a copy of the orders, 
# but with an extra field, total_amount, which is the net plus sales tax. 
# If a shipment is not to NC or TX, there’s no tax applied.

tax_rates = [ NC: 0.075, TX: 0.08 ]

orders = [[ id: 123, ship_to: :NC, net_amount: 100.00 ],
          [ id: 124, ship_to: :OK, net_amount: 35.50 ],
          [ id: 125, ship_to: :TX, net_amount: 24.00 ],
          [ id: 126, ship_to: :TX, net_amount: 44.80 ],
          [ id: 127, ship_to: :NC, net_amount: 25.00 ],
          [ id: 128, ship_to: :MA, net_amount: 10.00 ],
          [ id: 129, ship_to: :CA, net_amount: 102.00 ],
          [ id: 120, ship_to: :NC, net_amount: 50.00 ]]

IO.inspect Mylist.apply_tax_to_list_and_total(tax_rates,orders)
  




