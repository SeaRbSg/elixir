require Integer

defmodule Ch11 do
  def centrewords([head | tail]), do: _print([head | tail], _widest([head | tail], 0))

  defp _print([], _), do: []
  defp _print([head | tail], width) do
    [ lpad, rpad ] = _pad(width - String.length(head))
    :io.format("~s~s~s~n", [String.duplicate(" ", lpad), head, String.duplicate(" ", rpad)])
    _print(tail, width)
  end

  defp _pad(spaces)
    when Integer.is_odd(spaces), do: [ div(spaces, 2), div(spaces, 2) + 1 ]
  defp _pad(spaces), do: [ div(spaces, 2), div(spaces, 2) ]

  defp _widest([], widest), do: widest
  defp _widest([head | tail], widest) do
    if String.length(head) > widest do
      _widest(tail, String.length(head))
    else
      _widest(tail, widest)
    end
  end
end

IO.puts Ch11.centrewords([ "foo", "foobar"])
