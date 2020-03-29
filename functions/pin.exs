defmodule Greeter do
  def for(name, greeting) do
    fn
      ^name -> "#{greeting} #{name}"
      _ -> "Who the hell are you!?"
    end
  end
end

james = Greeter.for("Bruno", "Olá")

IO.puts(james.("Bruno"))
IO.puts(james.("Mario"))
