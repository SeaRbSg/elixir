# the recursive solution can blow up on large sets, so we're trying this
# so-called 'dynamic programming' solution.  STAHP using dynamic like that
# people.  All programs are dynamic

# take the simple case of making change for 10p using 1p and 5p coins
# * we figure out how many ways to make 1p using 1p, which is
#   one more than the ways we already know of to make 0p (0 + 1 = 1)
# * then we figure out how many ways to make 2p using 1p, which is
#   one more than the ways we already know of to make 1p (0 + 1 = 1)
# * keep iterating from 3p up to 10p, after which we have this set of strategies:
#   {0=>1, 1=>1, 2=>1, 3=>1, 4=>1, 5=>1, 6=>1, 7=>1, 8=>1, 9=>1, 10=>1}
# * now move onto the 5p denomination
# * the number of ways to make 5p is the number of ways we know how to make
#   0p (5-5) plus 1, so 0+1 = 1
# * the number of ways to make 6p is the number of ways we know how to make
#   1p (6-5) plus 1, so 1+1 = 2
# * keep iterating from 7p to 10p, after which we have this set of strategies:
#   {0=>1, 1=>1, 2=>1, 3=>1, 4=>1, 5=>2, 6=>2, 7=>2, 8=>2, 9=>2, 10=>3}
# * the number of ways to hit the target is now known

coins = [ 1, 2, 5, 10, 20, 50, 100, 200 ]
total = 200

# prime solution set: there is only one way to make change
# if you're only using one coin type
strategy = Hash.new(0)
strategy[0] = 1

# keep trying to make change using one less coin type each time
coins.each_with_index do |coinval, coinnum|
    # starting from the size of the coin up to the target value, figure
    # out how many ways to hit that target using just the coin we're on
    coinval.upto(total).each do |target|
        # using coinval, we have one more way to hit the target than there
        # are ways to hit (target-coinval)
        strategy[target] += strategy[target - coinval]
    end
end

puts "there are #{strategy[total]} ways to make change for #{total}p using #{coins.map{|c| "#{c}p"}.join(', ')}"
