IO.puts "Exercise 01\n"
fizz_buzz = fn
  0, 0, _ -> IO.puts "FizzBuzz"
  0, _, _ -> IO.puts "Fizz"
  _, 0, _ -> IO.puts "Buzz"
  _, _, c -> IO.puts c
end

fizz_buzz.(0, 0, 10)
fizz_buzz.( 0, 10, 10 )
fizz_buzz.( 10, 0, 10 )
fizz_buzz.( 10, 10, 10 )

single_integer = fn (n) ->
  fizz_buzz.( rem(n,3), rem(n,5), n )
end

IO.puts "\nExercise 02\n"

single_integer.(10)
single_integer.(11)
single_integer.(12)
single_integer.(13)
single_integer.(14)
single_integer.(15)
single_integer.(16)
