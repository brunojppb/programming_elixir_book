prefix = fn first ->
  fn second ->
    "#{first} #{second}"
  end
end

p = prefix.("Hi,")
IO.puts(p.("Bruno"))
