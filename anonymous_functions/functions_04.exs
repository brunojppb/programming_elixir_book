prefix = fn first_str ->
  fn second_str ->
    IO.puts "#{first_str} #{second_str}"
  end
end

prefix.("Mr.").("Paulino")
