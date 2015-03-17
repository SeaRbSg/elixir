def prefix(str)
  lambda { |name| "#{str} #{name}" }
end

mrs = prefix("Mrs")
puts mrs.call("Smithers")

def prefix_alternative_lambda_syntax(str)
  -> (name) { "#{str} #{name}" }
end

mr = prefix_alternative_lambda_syntax("Mr")
puts mr.call("Smith")
