module Euler032

  def self.main
    digits = [1,2,3,4,5,6,7,8,9]
    digits.permutation(4)
      .map{ |front|
        product = front.join.to_i
        (digits - front).permutation(5).any?{ |back|
          back[0..0].join.to_i * back[1..-1].join.to_i == product ||
            back[0..1].join.to_i * back[2..-1].join.to_i == product
        } ? product : 0
      }
      .reduce(:+)
  end

end

puts Euler032.main

# Runtime: 1.60s
