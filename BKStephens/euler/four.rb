class Four 
  def self.calculate
    min, max = 100, 999
    max_palindrome = 0

    (min..max).each do |x|
      (x..max).each do |y|
        product = x * y
        max_palindrome = product if product > max_palindrome && is_palindrome?(product)
      end
    end
     
    max_palindrome
  end
  
  def self.is_palindrome?(n)
    n.to_s == n.to_s.reverse
  end
end
