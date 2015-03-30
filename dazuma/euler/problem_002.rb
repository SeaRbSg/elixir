module Euler002

  def self.using_loop(max)
    prev, cur, sum = 1,2,0
    until cur > max
      sum += cur if cur % 2 == 0
      prev, cur = cur, prev + cur
    end
    sum
  end


  def self.using_streams(max)
    fibs = Enumerator.new{ |y|
      prev, cur = 1, 1
      loop do
        y << cur
        prev, cur = cur, prev + cur
      end
    }
    fibs.lazy
      .find_all{ |a| a % 2 == 0 }
      .take_while{ |a| a <= max }
      .inject(:+)
  end

end


puts Euler002.using_streams(4000000)
