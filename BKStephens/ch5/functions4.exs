prefix = fn str ->
  fn name ->
    "#{str} #{name}"
  end
end

mrs = prefix.("Mrs")
IO.puts mrs.("Smithers")
