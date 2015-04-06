#Implelment all?, each, filter, and take

defmodule MyEnum do
  def all?([], _func), do: true
  def all?([head|tail], func) do
    func.(head) && MyEnum.all?(tail, func)
  end

  def each([], _func), do: nil 
  def each([head|tail], func) do
    func.(head)
    MyEnum.each(tail, func)
  end

  def filter([], _func), do: []
  def filter([head|tail], func) do
    if func.(head) do
      [head | MyEnum.filter(tail, func)]
    else
      MyEnum.filter(tail, func)
    end
  end

  def split(list, 0), do: {[], list}
  def split([head | tail], count) do 
    {left, right} = MyEnum.split(tail, count-1)
    {[head | left], right}
  end

  def take(_list, 0), do: []
  def take([head | tail], count) do
    [head | MyEnum.take(tail, count-1)]
  end
end
