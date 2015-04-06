import Enum

deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit, rank]


#Why does this not produce [2,C] [2,D] [2,H] [2,S] [3,C] etc?
IO.inspect deck |> shuffle |> chunk 13