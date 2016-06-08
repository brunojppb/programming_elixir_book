handle_open = fn
  { :ok, file } -> "First line: #{IO.read(file, :line)}"
  { _, error } -> "Error: #{:file.format_error(error)}"
end
IO.puts "That one exists"
IO.puts handle_open.(File.open("hello.txt"))

IO.puts "That one doesn't"
IO.puts handle_open.(File.open("ghost_file.txt"))
