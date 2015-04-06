require 'set'

module Euler029

  def self.main
    set = Set.new
    (2..100).each do |a|
      (2..100).each do |b|
        set.add(a**b)
      end
    end
    set.size
  end

end

puts Euler029.main

# Runtime: 0.05s
