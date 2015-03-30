defmodule MyList do
  def sum_no_accum_1([total]), do: total
  def sum_no_accum_1([ head | tail]) do
    head_of_tail = List.first(tail)
    sum_of_first_two_elements = head + head_of_tail
    sum_no_accum_1(List.replace_at(tail, 0, sum_of_first_two_elements))
  end

  # This way is a lot better. Using replace_at creates a new list to do its job.
  def sum_no_accum_2([]), do: 0
  def sum_no_accum_2([ head | tail ]), do: head + sum_no_accum_2(tail)
end
