defmodule BookRoom do

  def book(%{ name: name, height: height })
  when height > 1.9 do
    IO.puts "Need an extra loong bed for #{name}"
  end

  def book(%{ name: name, height: height })
  when height < 1.3 do
    IO.outs "Need low shower controls for #{name}"
  end

  def book(person) do
    IO.puts "Need regular bed for #{person.name}"
  end
end
